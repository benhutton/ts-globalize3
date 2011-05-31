$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'lib')

require 'rubygems'
require 'bundler'
 
Bundler.setup

require 'thinking_sphinx'


RSpec.configure do |config|
  #
end
