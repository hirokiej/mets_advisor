# frozen_string_literal: true

require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList["test/**/test_*.rb"]
  t.verbose = true
end

desc "Run tests with coverage"
task :test_coverage do
  ENV['COVERAGE'] = 'true'
  Rake::Task[:test].invoke
end

desc "Run specific test file"
task :test_file, [:file] do |t, args|
  if args[:file]
    ruby "-Ilib:test #{args[:file]}"
  else
    puts "Usage: rake test_file[test/test_mets.rb]"
  end
end

task default: :test
