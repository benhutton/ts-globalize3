require 'bundler'
require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rake'
require "rspec/core/rake_task"

desc "Run the specs under spec"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end
