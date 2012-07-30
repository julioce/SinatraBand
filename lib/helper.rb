def generate_file_from_template directory, file, extension
  
  File.open("./#{@APP_NAME}#{directory}/#{file}.#{extension}", "w") do |f|
  	begin
  	  file_template = ERB.new(File.open("#{@ROOT}#{directory}/#{file}.erb").read())
  	rescue (Errno::ENOENT)
  	  put_error_and_quit "Error: Missing template for file #{@ROOT}#{directory}/#{file}.#{extension}"
  	end

  	begin
  	  f.write(file_template.result(binding))
  	  puts "#{directory}/#{file}.#{extension} file created"
  	rescue (Errno::ENOENT)
  	  put_error_and_quit "Error creating #{file}.#{extension}"
  	end

  end
end


def mkdir diretory
  begin
    Dir.mkdir diretory
    puts "#{diretory} directory created."
  rescue (Errno::EEXIST)
    put_error_and_quit "Error: You already have a directory #{diretory}."
  end
end


def put_error_and_quit error_message
  puts error_message
  exit
end