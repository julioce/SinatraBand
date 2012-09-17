Gem::Specification.new do |s|
  s.name        = 'sinatraband'
  s.version     = '0.1.2'
  s.executables << 'sinatraband'
  s.date        = '2012-09-17'
  s.summary     = "Sinatra app generator"
  s.description = "Ruby gem to create a basic sinatra app."
  s.authors     = ["Júlio Bueno"]
  s.email       = 'julioce@gmail.com'
  s.files       = ["lib/templates/models/model.erb",
                   "lib/templates/views/index.erb",
                   "lib/templates/app.erb", 
                   "lib/templates/database.erb", 
                   "bin/helper.rb"]
  s.homepage    = 'https://github.com/julioce/SinatraBand'
end