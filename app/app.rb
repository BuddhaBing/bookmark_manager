require 'sinatra/base'
require_relative './models/link.rb'

class BookmarkManager < Sinatra::Base
  ENV['RACK_ENV'] ||= 'development'

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  post '/links' do
    Link.create(url: params[:url], title: params[:name])
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end