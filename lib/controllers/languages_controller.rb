require 'controllers/application_controller.rb'
require 'languages'

class LanguagesController < ApplicationController
  configure do
    set :languages, ::Languages.new
  end

  post "/top" do
    @username = params[:username]
    return erb :invalid_username unless GitHubUtil.valid_username?(@username)
    display_language_data
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
end
