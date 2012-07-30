Gem::Specification.new do |s|
  s.name        = 'sinatraband'
  s.version     = '0.0.2'
  s.executables << 'sinatraband'
  s.date        = '2012-07-29'
  s.summary     = "Sinatra app generator"
  s.description = "Ruby gem to create a basic sinatra app."
  s.authors     = ["Júlio Bueno"]
  s.email       = 'julioce@gmail.com'
  s.files       = ["lib/templates/app.erb", "lib/templates/database.erb", "lib/templates/views/index.erb"]
  s.homepage    = 'https://github.com/julioce/SinatraBand'
end