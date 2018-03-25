ENV['RACK_ENV'] = 'test'

require 'controllers/api_controller'
require 'rack/test'
require 'json'

RSpec.describe APIController do
  include Rack::Test::Methods

  let (:languages) {Languages.new(Helper.create_mocked_api)}

  def app
    APIController.new
  end

  before do
    APIController.set :languages, languages
  end

  describe "GET /top" do
    it "gives json payload of repositories" do
      get "/top", {:username => "willcurry"}
      expected = [{:language => "ruby", :bytes => 6000}, {:language => "python", :bytes => 500}, {:language => "html", :bytes => 100}].to_json
      expect(last_response.body).to eq(expected)
    end

    context "error payloads" do
      it "gives error payload when the username is invalid" do
        get "/top", {:username => "y"}
        expected = {status: "fail", error: "username is invalid"}.to_json
        expect(last_response.body).to eq(expected)
      end

      it "gives error payload when there is no user data" do
        languages = Languages.new(Helper.create_api_with_no_repositories)
        APIController.set :languages, languages
        get "/top", {:username => "willcurry"}
        expected = {status: "fail", error: "user has no data"}.to_json
        expect(last_response.body).to eq(expected)
      end
    end
  end
end
