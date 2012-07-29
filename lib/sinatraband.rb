require 'erb'

def generate_file_from_template directory, file, extension
  
  File.open("../#{@app_name}#{directory}/#{file}.#{extension}", "w") do |f|
  	begin
  	  file_template = ERB.new(File.open("./templates#{directory}/#{file}.erb").read())
  	rescue (Errno::ENOENT)
  	  puts "Error: Missing template for file #{file}.#{extension}"
  	  exit
  	end

  	begin
  	  f.write(file_template.result(binding))
  	  puts "#{directory}/#{file}.#{extension} file created"
  	rescue (Errno::ENOENT)
  	  puts "Error creating #{file}.#{extension}"
  	  exit
  	end

  end
end


def mkdir diretory
  begin
    Dir.mkdir diretory
  rescue (Errno::EEXIST)
    puts "Error: You already have a directory #{diretory}."
    exit
  end
end

#Get the app name
if !ARGV[0]
	puts "Error: Missing app name as parameter"
	exit
end

@app_name = ARGV[0]

#Creates de App diretory
mkdir "../#{@app_name}"

#Creates de App file
generate_file_from_template "", :app, :rb

#Creates de Database file
generate_file_from_template "", :database, :rb

#Creates de View diretory
mkdir "../#{@app_name}/views"

#Creates de index file
generate_file_from_template "/views", :index, :erb