
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "err_merchant/version"

Gem::Specification.new do |spec|
  spec.name          = "err_merchant"
  spec.version       = ErrMerchant::VERSION
  spec.authors       = ["Fabian Schwahn"]
  spec.email         = ["fabian.schwahn@gmail.com"]

  spec.summary       = "Rails Engine for rendering error pages"
  spec.homepage      = "https://github.com/fschwahn/err_merchant"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 7.1', '< 9'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'combustion', ">= 1.3.5"
  spec.add_development_dependency 'sqlite3'
  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara', '>= 2.2'
end
