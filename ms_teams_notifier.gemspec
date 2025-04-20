# frozen_string_literal: true

require_relative "lib/ms_teams_notifier/version"

Gem::Specification.new do |spec|
  spec.name = "ms_teams_notifier"
  spec.version = MsTeamsNotifier::VERSION
  spec.authors = ["Abdullah Barrak"]
  spec.email = ["abdullah@abarrak.com"]

  spec.summary = "A simple ms teams noftifier gem."
  spec.description = "A ruby library that offers simple notification capablities for Microsoft Teams."
  spec.homepage = "https://rubygems.org/gems/ms_teams_notifier"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/abarrak/ms_teams_notifier/blob/main/lib/ms_teams_notifier"
  spec.metadata["changelog_uri"] = "https://github.com/abarrak/ms_teams_notifier/releases"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", "~> 7.1"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.16"
  spec.add_development_dependency "standard", "~> 1.3"
  spec.add_development_dependency "simplecov", "0.22.0"
  spec.add_development_dependency "simplecov-cobertura", "~> 2.1.0"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 1.0"
end
