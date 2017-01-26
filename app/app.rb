ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user])
    end

    def tags(link)
      @tags = link.tags.map(&:name).join(', ')
    end
  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/new' do
    erb :new
  end

  post '/newbookmark' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split(' ').each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :links
  end

  get '/signup' do
    @user = User.new
    erb :signup
  end

  post '/users' do
    email = params[:email]
   @user = User.create(email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
   if @user.save
     session[:user] = @user.id
     redirect '/'
   else
     flash.now[:notice] = "Password and confirmation password do not match"
     erb :signup
   end
  end
  # start the server if ruby file executed directly
  run! if app_file == $PROGRAM_NAME
end
