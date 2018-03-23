require "sinatra"

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, File.expand_path('../../../views', __FILE__)

  get "/" do
    erb :index
  end
end
