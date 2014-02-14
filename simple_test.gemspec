lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require File.expand_path("../lib/simple_test/version", __FILE__)

Gem::Specification.new do |s|
  s.name = 'simple_test'
  s.version = SimpleTest::VERSION
  s.date = '2014-02-14'
  s.summary = 'Allows testing for equality and inequality in ruby in a simple way'
  s.description = 'Testing suite for Ruby. Allows simple comparisons between to instances'
  s.authors = ['Erick Castillo']
  s.email = 'ecastillo@pernix-solutions.com'
  s.files = Dir.glob("{bin,lib}/**/*") + %w(README.md LICENSE)
  s.test_files = Dir['spec/*']
  s.executables << 'simple_test'
  s.homepage = 'https://github.com/erickcsh/SimpleTest'
  s.license = 'MIT'
end
