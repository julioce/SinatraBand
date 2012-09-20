def generate_file_from_template input={:directory => './'+@name, :template => '', :final_file => '', :extension => ''}

  file_name = "./#{@name}#{input[:directory]}/#{input[:final_file]}.#{input[:extension]}"

  if File.exists?(file_name) && File.file?(file_name)
  	File.delete(file_name)
  	puts "Notice: You already have a file #{file_name}. Older version deleted."
  end

  File.open(file_name, 'w') do |f|
	begin
     file_template = ERB.new(File.open("#{@root}#{input[:directory]}/#{input[:template]}.erb").read)
	rescue (Errno::ENOENT)
	  put_error_and_quit "Error: Missing template for file #{@root}#{input[:directory]}/#{input[:template]}.#{input[:extension]}."
	end

	begin
	  f.write(file_template.result(binding))
	  puts ".#{input[:directory]}/#{input[:final_file]}.#{input[:extension]} file created."  
	rescue (Errno::ENOENT)
      put_error_and_quit "Error creating #{input[:final_file]}.#{input[:extension]}."
	end
  end
end


def mkdir input={:directory => './'+@name}
  begin
    Dir.mkdir input[:directory]
    puts "#{input[:directory]} directory created."
  rescue (Errno::EEXIST)
    puts "Notice: You already have a directory #{input[:directory]}."
  end
end


def elaborates_model_properties input={:model_properties => ''}
  
  new_model_properties = Array.new

  input[:model_properties].each do |model_property|
    name = model_property.to_s.split(':')[0].downcase
    type = model_property.to_s.split(':')[1].capitalize
    
    if type == "Datetime" then type = "DateTime" end

    if !["id", "created_at", "updated_at"].include? name
  	  new_model_properties << "property :" + name + ", " + type
    end
  end

  new_model_properties
end


def put_error_and_quit input={:error_message => 'An error has ocorred.'}
  puts input[:error_message]
  exit
end
