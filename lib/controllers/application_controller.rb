require 'sinatra'
require 'github_util'

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, File.expand_path('../../../views', __FILE__)
  set :public_folder, File.expand_path('../../../public', __FILE__)

  get "/" do
    erb :index
  end
end
