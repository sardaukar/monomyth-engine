$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monomyth_engine/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monomyth_engine"
  s.version     = MonomythEngine::VERSION
  s.authors     = ["Bruno Antunes"]
  s.email       = ["sardaukar.siet@gmail.com"]
  s.homepage    = "http://nootch.net"
  s.summary     = "Engine with a thousand faces"
  s.description = "One endpoint, multiple routes!"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.5"

  s.add_development_dependency "sqlite3"
end
