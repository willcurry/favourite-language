require 'controllers/application_controller.rb'
require 'languages'
require 'json'

class LanguagesController < ApplicationController
  configure do
    set :languages, ::Languages.new
  end

  before do
    @username = params[:username]
  end

  post "/top" do
    return erb :invalid_username if !valid_username?
    display_language_data
  end

  get "/top/json" do
    content_type :json
    return {status: "fail", error: "username is invalid"}.to_json if !valid_username?
    get_language_payload
  end

  private

  def get_language_payload
    begin
      @languages_to_display = settings.languages.get_top_three(@username)
    rescue
      {status: "fail", error: "user has no data"}.to_json
    else
      @languages_to_display.to_json
    end
  end

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
