require 'rubygems'
require 'rake'
require 'echoe'
Echoe.new('yammer_oauth', '0.1.0') do |p|
    p.description    = "OAuth for yammer, adopted from twitter_oauth"
    p.url            = "http://github.com/isaiah/yammer_oauth.git"
    p.author         = "Isaiah Peng"
    p.email          = "isaiah.peng@rorcraft.com"
    p.ignore_pattern = ["tmp/*", "script/*"]
    p.development_dependencies = ['oauth']
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }
