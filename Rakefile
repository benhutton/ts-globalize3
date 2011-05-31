require 'bundler'
require 'bundler/setup'
Bundler::GemHelper.install_tasks

require 'rake'
require "rspec/core/rake_task"
require 'cucumber/rake/task'

desc "Run the specs under spec"
RSpec::Core::RakeTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

Cucumber::Rake::Task.new do |task|
  task.cucumber_opts = '--exclude features/thinking_sphinx'
end
