Gem::Specification.new do |s|
  s.name        = 'sinatraband'
  s.version     = '0.2.1'
  s.executables << 'sinatraband'
  s.date        = '2013-12-08'
  s.summary     = "Sinatra simple app generator"
  s.description = "Ruby gem to create a basic scaffold sinatra app with activerecord."
  s.authors     = ["Julio Bueno"]
  s.email       = 'julioce@gmail.com'
  s.license    = 'OSL-3.0'
  s.homepage    = 'https://github.com/julioce/SinatraBand'
  s.files       = [ "lib/templates/controllers/controller.erb",
				            "lib/templates/models/model.erb",
  				          "lib/templates/views/index.erb",
                    "lib/templates/app.erb", 
                    "lib/templates/Gemfile.erb", 
                    "lib/templates/rakefile.erb", 
                    "lib/templates/db/migrate/migration.erb", 
                    "lib/templates/db/connection.erb", 
                    "bin/app.rb", 
                    "bin/helper.rb"]
  s.add_runtime_dependency 'activesupport'
end