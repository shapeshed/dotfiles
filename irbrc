require 'rubygems'
require 'interactive_editor'

if ENV['RAILS_ENV'] 
  require 'hirb' 
  require 'active_record' 
  Hirb.enable 
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end
