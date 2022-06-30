require_relative "lib/newsletter/version"

Gem::Specification.new do |spec|
  spec.name        = "newsletter"
  spec.version     = Newsletter::VERSION
  spec.authors     = ["captproton"]
  spec.email       = ["carl@wdwhub.net"]
  spec.homepage    = "https://github.com/captproton/newsletter"
  spec.summary     = "revivial of the newsletter gem" 
  spec.description = "Email newsletter templating and management system which allows a designer to develop templates and elements that are email-friendly and allows a user to create newsletters without html/css knowledge utilizing a wysiwyg interface."
    spec.license     = "MIT"
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/captproton/newsletter"
  spec.metadata["changelog_uri"] = "https://github.com/captproton/newsletter/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
  spec.test_files = Dir["spec/**/*"]
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
  spec.add_dependency  "acts_as_list", "~> 1.0", ">= 1.0.4"
  spec.add_dependency  "cancancan", "~> 3.4"
  spec.add_dependency 'will_paginate', '~> 3.3', '>= 3.3.1'
  spec.add_dependency 'jquery-rails', '~> 4.5'
  spec.add_dependency 'jquery-ui-rails', '~> 6.0', '>= 6.0.1'

  spec.add_development_dependency 'rspec-rails'
  spec.add_development_dependency 'capybara'
  spec.add_development_dependency 'factory_bot_rails'
  spec.add_development_dependency 'ffaker'
  spec.add_development_dependency 'devise', '~> 4.8', '>= 4.8.1'


  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-rails'

  spec.add_development_dependency 'thin'
  spec.add_development_dependency 'pry-doc'
  spec.add_development_dependency 'pry-rails'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'binding_of_caller'
end
