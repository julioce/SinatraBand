Gem::Specification.new do |s|
  s.name        = 'sinatraband'
  s.version     = '0.1.5'
  s.executables << 'sinatraband'
  s.date        = '2012-09-19'
  s.summary     = "Sinatra app generator"
  s.description = "Ruby gem to create a basic scaffold sinatra app."
  s.authors     = ["Julio Bueno"]
  s.email       = 'julioce@gmail.com'
  s.files       = ["lib/templates/controllers/controller.erb",
				   "lib/templates/models/model.erb",
  				   "lib/templates/views/index.erb",
                   "lib/templates/app.erb", 
                   "lib/templates/database.erb", 
                   "bin/app.rb", 
                   "bin/helper.rb"]
  s.homepage    = 'https://github.com/julioce/SinatraBand'
end