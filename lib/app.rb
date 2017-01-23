require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  # set :views, File.dirname(__FILE__) + '/lib/views'
  # set :public_folder, File.dirname(__FILE__) + '/lib/public'

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end
  # start the server if ruby file executed directly
  run! if app_file == $0
end
