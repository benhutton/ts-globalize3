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

require File.dirname(__FILE__) + '/../../lib/thinking_sphinx/globalize3.rb'

require 'cucumber/thinking_sphinx/internal_world'
world = Cucumber::ThinkingSphinx::InternalWorld.new
world.configure_database

world.setup
