def generate_file_from_template directory, template, final_file, extension
  
  File.open("./#{@APP_NAME}#{directory}/#{final_file}.#{extension}", "w") do |f|
  	begin
  	  file_template = ERB.new(File.open("#{@ROOT}#{directory}/#{template}.erb").read())
  	rescue (Errno::ENOENT)
  	  put_error_and_quit "Error: Missing template for file #{@ROOT}#{directory}/#{template}.#{extension}"
  	end

  	begin
  	  f.write(file_template.result(binding))
  	  puts ".#{directory}/#{final_file}.#{extension} file created"
  	rescue (Errno::ENOENT)
  	  put_error_and_quit "Error creating #{final_file}.#{extension}"
  	end

  end
end


def mkdir diretory
  begin
    Dir.mkdir diretory
    puts "#{diretory} directory created."
  rescue (Errno::EEXIST)
    puts "Notice: You already have a directory #{diretory}."
  end
end

def elaborates_model_properties model_properties
  
  new_model_properties = Array.new()

  model_properties.each do |model_property|
  	new_model_properties << "property :" + model_property.to_s().split(':')[0] + ", " + model_property.to_s().split(':')[1].capitalize
  end

  new_model_properties
end


def put_error_and_quit error_message
  puts error_message
  exit
end