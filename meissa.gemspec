$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "meissa/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "meissa"
  s.version     = Meissa::VERSION
  s.authors     = ["jcottobboni"]
  s.email       = ["jcottobboni@gmail.com"]
  s.homepage    = "http://www.google.com"
  s.summary     = "Engine for configurations"
  s.description = "provides basic configurations por apps"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.0.2"


end
