# frozen_string_literal: true

require_relative "lib/mets_advisor/version"

Gem::Specification.new do |spec|
  spec.name = "mets_advisor"
  spec.version = MetsAdvisor::VERSION
  spec.authors = ["hirokiej"]
  spec.email = ["123009866+hirokiej@users.noreply.github.com"]

  spec.summary = "CLI tool to calculate METs(Metabolic Equivalents) for physical activities"
  spec.description = "MetsAdvisor helps users estimate weekly METs based on activity input, supporting health maintenance."
  spec.homepage = "https://github.com/hirokiej/mets_advisor"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hirokiej/mets_advisor"
  spec.metadata["changelog_uri"]   = "https://github.com/hirokiej/mets_advisor/blob/main/CHANGELOG.md"

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
end
