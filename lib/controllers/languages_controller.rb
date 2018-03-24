require 'controllers/application_controller.rb'
require 'languages'

class LanguagesController < ApplicationController
  configure do
    set :languages, ::Languages.new
  end

  post "/top" do
    @username = params[:username]
    if valid_username?
      display_language_data
    else
      erb :invalid_username
    end
  end

  private

  def display_language_data
    begin
      @languages_to_display = settings.languages.get_top_three(@username)
    rescue
      erb :no_repositories
    else
      erb :languages
    end
  end

  def valid_username?
    !@username.nil? && @username.length > 5 && @username.length < 33
  end
end
