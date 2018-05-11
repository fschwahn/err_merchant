$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "err_merchant/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "err_merchant"
  s.version     = ErrMerchant::VERSION
  s.authors     = ["Fabian Schwahn"]
  s.email       = ["fabian.schwahn@gmail.com"]
  s.homepage    = "https://github.com/fschwahn/err_merchant"
  s.summary     = "Rails Engine for rendering error pages"
  s.description = "Rails Engine for rendering error pages"

  s.files = Dir["{lib,app,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency 'rails', '>= 3.2', '< 5.0'
  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'combustion', '~> 0.5.2'
  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'airbrake'
  s.add_development_dependency 'rspec-rails', '~> 2.0'
  s.add_development_dependency 'capybara', '~> 1.0'
end
