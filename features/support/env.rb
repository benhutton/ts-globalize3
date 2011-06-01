require 'rubygems'
require 'bundler'
Bundler.setup

require 'ruby-debug'
Debugger.settings[:autoeval] = true

require 'globalize3'
require 'thinking_sphinx'
require 'active_record'
ActiveRecord::Base.send(:include, ThinkingSphinx::ActiveRecord)

require 'database_cleaner'
require 'database_cleaner/cucumber'
DatabaseCleaner.strategy = :truncation

$:.unshift File.dirname(__FILE__) + '/../../lib'

require 'cucumber/thinking_sphinx/internal_world'
world = Cucumber::ThinkingSphinx::InternalWorld.new
world.configure_database

world.setup
