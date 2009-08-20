require 'rubygems'
require 'rspec'
require 'mocha'

lib_files = File.join(File.dirname(__FILE__), "..", "lib")

Dir.glob(File.join(lib_files, "**")).each do |file|
  require file
end
