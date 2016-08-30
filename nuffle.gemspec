Gem::Specification.new do |s|
  s.name                  = 'nuffle'
  s.version               = '1.0.1'
  s.date                  = '2016-05-23'
  s.summary               = "Nuffle"
  s.description           = "Nuffle, The Ruby Library, is a dice calculator library that provides the functionality to perform complex dice rolls and calculate their result (ex: `5d6 + 1d20 / (1d6 - 2)`."
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
