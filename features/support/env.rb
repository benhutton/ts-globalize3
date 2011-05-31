require 'rubygems'
require 'bundler'
Bundler.setup

require 'thinking_sphinx'
require 'active_record'
ActiveRecord::Base.send(:include, ThinkingSphinx::ActiveRecord)

$:.unshift File.dirname(__FILE__) + '/../../lib'

require 'cucumber/thinking_sphinx/internal_world'
world = Cucumber::ThinkingSphinx::InternalWorld.new
world.configure_database


world.setup
