require 'pathname'
require 'erb'
require_relative './helper.rb'

class App
  attr_accessor :name, :root

  def proccess_arguments
  	if ARGV.empty?
  		put_error_and_quit :error_message => "Error: Missing arguments"
  	end

    #Get the global current path
    @root = Pathname(__FILE__).dirname.realpath.to_s+"/../lib/templates"

    #Defines operation
    case ARGV[0].downcase
      when "create"
        #Get de App name
        if ARGV[1].nil?
          put_error_and_quit :error_message => "Error: Missing arguments for create action"
        else
          @name = ARGV[1]
          create_app
        end
      when "model"
        if ARGV[1].nil?
          put_error_and_quit :error_message => "Error: Missing arguments for model action"
        else
          if ARGV.length > 2
            model_properties = Array.new
            ARGV.each_with_index do |property, index|
              if index > 1
                model_properties << property
              end
            end
          end
          create_model :model_name => ARGV[1], :model_properties => model_properties
        end
      else
        put_error_and_quit :error_message => "Error: Unknow arguments"
    end
  end

  def create_app
    #Creates de App diretory
    mkdir :directory => "./#{@name}"

    #Creates de App file
    generate_file_from_template :directory => "", :template => "app", :final_file => "app", :extension => "rb"

    #Creates de Database file
    generate_file_from_template :directory => "", :template => "database", :final_file => "database", :extension => "rb"

    #Creates de Models diretory
    mkdir :directory => "./#{@name}/models"

    #Creates de Controllers diretory
    mkdir :directory => "./#{@name}/controllers"

    #Creates de View diretory
    mkdir :directory => "./#{@name}/views"

    #Creates de index file
    generate_file_from_template :directory => "/views", :template => "index", :final_file => "index", :extension => "erb"
  end

  def create_model input={:model_name => '', :model_properties => {}}
    if input[:model_properties].nil?
      put_error_and_quit :error_message => "Error: Missing arguments for model action"
    end
    
    @model_name = input[:model_name].capitalize
    @model_properties = elaborates_model_properties :model_properties => input[:model_properties]

    #Creates de Model file
    generate_file_from_template :directory => "/models", :template => "model", :final_file => input[:model_name].downcase, :extension => "rb"

    #Creates de Controller file
    generate_file_from_template :directory => "/controllers", :template => "controller", :final_file => input[:model_name].downcase, :extension => "rb"

    #Creates de View diretory
    mkdir :directory => ".#{@name}/views/"+input[:model_name].downcase
  end

end
