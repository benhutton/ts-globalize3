# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ts-globalize3/version"

Gem::Specification.new do |s|
  s.name        = "ts-globalize3"
  s.version     = ThinkingSphinx::Globalize3::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ben Hutton"]
  s.email       = ["benhutton@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Thinking Sphinx/Globalize3 integration.}
  s.description = %q{A Thinking Sphinx plugin to index and search models translated by Globalize3.}

  s.rubyforge_project = "ts-globalize3"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  {
    'rspec'         => '~> 2.6.0'
  }.each do |lib, version|
    s.add_development_dependency lib, version
  end

  {
    'globalize3'         => '~> 0.1.0',
    'thinking_sphinx'    => '~> 2.0.5'
  }.each do |lib, version|
    s.add_runtime_dependency lib, version
  end

end
