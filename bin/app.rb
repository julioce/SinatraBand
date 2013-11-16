require 'pathname'
require 'erb'
require 'active_support/inflector'
require_relative './helper.rb'

class App
  attr_accessor :name, :root

  def proccess_arguments
  	if ARGV.empty?
  		put_error_and_quit error_message: "Error: Missing arguments"
  	end

    #Get the global current path
    @root =  "#{Pathname(__FILE__).dirname.realpath.to_s}/../lib/templates"

    #Defines operation
    case ARGV[0].downcase
      when "create"
        #Get the App name
        if ARGV[1].nil?
          put_error_and_quit error_message: "Error: Missing arguments for create action"
        else
          @name = ARGV[1]
          create_app
        end
      when "model"
        if ARGV[1].nil?
          put_error_and_quit error_message: "Error: Missing arguments for model action"
        else
          if ARGV.length > 2
            model_properties = Array.new
            ARGV.each_with_index do |property, index|
              if index > 1
                model_properties << property
              end
            end
          end
          create_model model_name: ARGV[1], model_properties: model_properties
        end
      else
        put_error_and_quit error_message: "Error: Unknow arguments"
    end
  end

  def create_app
    #Creates the App diretory
    mkdir directory: "./#{@name}"

    #Creates the Models diretory
    mkdir directory: "./#{@name}/models"

    #Creates the Controllers diretory
    mkdir directory: "./#{@name}/controllers"

    #Creates the View diretory
    mkdir directory: "./#{@name}/views"

    #Creates the Database diretory
    mkdir directory: "./#{@name}/db"
    mkdir directory: "./#{@name}/db/migrate"

    #Creates the Gemfile
    generate_file_from_template directory: "", template: "Gemfile", final_file: "Gemfile", extension: ""

    #Creates the Rakefile file
    generate_file_from_template directory: "", template: "rakefile", final_file: "rakefile", extension: ".rb"

    #Creates the App file
    generate_file_from_template directory: "", template: "app", final_file: "app", extension: ".rb"

    #Creates the Database file
    generate_file_from_template directory: "/db", template: "connection", final_file: "connection", extension: ".rb"

    #Creates the index file
    generate_file_from_template directory: "/views", template: "index", final_file: "index", extension: ".erb"
  end

  def create_model input={model_name: '', model_properties: {}}
    if input[:model_properties].nil?
      put_error_and_quit error_message: "Error: Missing arguments for model action"
    end
    
    @model_name = input[:model_name].capitalize
    @model_properties = elaborates_model_properties model_properties: input[:model_properties]

    #Creates the Model file
    generate_file_from_template directory: "/models", template: "model", final_file: input[:model_name].downcase, extension: ".rb"

    #Creates the Controller file
    generate_file_from_template directory: "/controllers", template: "controller", final_file: input[:model_name].downcase.pluralize, extension: ".rb"

    #Creates the migration file
    generate_file_from_template directory: "/db/migrate", template: "migration", final_file: "#{Time.now.utc.strftime("%Y%m%d%H%M%S")}_create_#{input[:model_name].downcase}", extension: ".rb"

    #Creates the View diretory
    mkdir directory: ".#{@name}/views/#{input[:model_name].downcase.pluralize}"
  end

end
