ENV['RACK_ENV'] = 'test'

require_relative '../lib/controllers/application_controller'
require 'rack/test'

RSpec.describe ApplicationController do
  include Rack::Test::Methods

  let (:languages) {Languages.new(Helper.create_mocked_api)}

  def app
    ApplicationController.new
  end

  before do
    ApplicationController.set :languages, languages
  end

  it "get / route returns ok response and form is present" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("<form")
  end

  it "post /search route returns ok response" do
    post "/search"
    expect(last_response).to be_ok
  end

  it "post /search displays top 3 languages" do
    post "/search"
    expect(last_response).to be_ok
    expected = "<p>Language: ruby Bytes: 6000</p>\n  <p>Language: python Bytes: 500</p>\n  <p>Language: html Bytes: 100</p>"
    expect(last_response.body).to include(expected)
  end
end
