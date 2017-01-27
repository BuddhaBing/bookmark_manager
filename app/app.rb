ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'datamapper_setup.rb'
require 'sinatra/flash'
require 'sinatra/partial'

require_relative 'server.rb'
require_relative 'controllers/users.rb'
require_relative 'controllers/links.rb'
require_relative 'controllers/tags.rb'
require_relative 'controllers/sessions.rb'
