require 'sinatra'
require_relative '../languages.rb'

class ApplicationController < Sinatra::Base
  use Rack::Session::Pool, :expire_after => 2592000
  set :views, File.expand_path('../../../views', __FILE__)

  configure do
    set :languages, ::Languages.new
  end

  get "/" do
    erb :index
  end

  post "/search" do
    username = params[:username]
    @languages_to_display = settings.languages.get_top_three(username)
    erb :languages
  end
end
