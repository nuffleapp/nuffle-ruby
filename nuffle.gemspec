Gem::Specification.new do |s|
  s.name                  = 'nuffle'
  s.version               = '0.1.0'
  s.date                  = '2016-05-13'
  s.summary               = "Nuffle"
  s.description           = "Roll a die with any number of sides."
  s.authors               = ["Zachary Flower"]
  s.email                 = 'zach@zacharyflower.com'
  s.files                 = ["lib/nuffle.rb"]
  s.homepage              = 'https://github.com/nuffleapp/nuffle-ruby'
  s.license               = 'MIT'
  s.required_ruby_version = '>= 1.9'

  s.add_development_dependency "minitest", ["~> 0"]
  s.add_development_dependency "simplecov", ["~> 0"]
  s.add_development_dependency "codecov", ["~> 0"]
end