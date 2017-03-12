class Bookmark_manager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    # @user = User
    erb(:links)
  end

  get '/links/new' do
    erb(:'links/new')
  end

  post '/links' do
    link = Link.new(url: params[:url],
                    title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end
    link.save
    redirect to('/links')
  end
end
