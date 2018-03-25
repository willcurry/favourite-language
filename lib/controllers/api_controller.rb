require 'controllers/application_controller.rb'
require 'languages'
require 'json'
require 'github_util'

class APIController < ApplicationController
  configure do
    set :languages, ::Languages.new
  end

  get "/top" do
    @username = params[:username]
    content_type :json
    return {status: "fail", error: "username is invalid"}.to_json unless GitHubUtil.valid_username?(@username)
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
end
