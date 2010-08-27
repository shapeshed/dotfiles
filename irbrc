
require 'rubygems'
require 'interactive_editor'

# Colorize results
begin
  require 'rubygems'
  require 'wirble'
  Wirble.init
  Wirble.colorize
rescue LoadError
  puts "Error loading Wirble. Run 'sudo gem install wirble' to enable colorized results."
end
           
# Draw ASCII tables
require 'hirb'
require 'hirb/import_object'
Hirb.enable
extend Hirb::Console

# Log SQL queries to irb
if ENV.include?('RAILS_ENV') && !Object.const_defined?('RAILS_DEFAULT_LOGGER')
    require 'logger'
    RAILS_DEFAULT_LOGGER = Logger.new(STDOUT)
end

