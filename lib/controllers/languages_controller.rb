require 'controllers/application_controller.rb'
require 'languages'

class LanguagesController < ApplicationController
  configure do
    set :languages, ::Languages.new
  end

  post "/top" do
    @username = params[:username]
    @languages_to_display = settings.languages.get_top_three(@username)
    erb :languages
  end
end
