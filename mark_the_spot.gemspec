require_relative "lib/mark_the_spot/version"

Gem::Specification.new do |spec|
  spec.name        = "mark_the_spot"
  spec.version     = MarkTheSpot::VERSION
  spec.authors     = ["mark mcdonald"]
  spec.email       = ["mark.mcdonald@gmail.com"]
  spec.homepage    = "https://github.com/markmcdonald51/mark_the_spot.git"
  spec.summary     = "Create a simple yet powerful interface to collect data mesurements to be used for analysis for ML."
  spec.description = "Will create has_many with {action_name}_{class_name} in user model"
  spec.license     = "MIT" 
  
  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  #spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/markmcdonald51/mark_the_spot.git"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", ">= 7.0.3"
end
