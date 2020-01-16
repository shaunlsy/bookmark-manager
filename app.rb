require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    erb :form
  end

  post '/bookmarks' do
    Bookmark.create(url: params[:url], title: params[:title])
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
