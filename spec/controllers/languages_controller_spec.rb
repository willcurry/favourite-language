ENV['RACK_ENV'] = 'test'

require 'controllers/languages_controller'
require 'rack/test'

RSpec.describe LanguagesController do
  include Rack::Test::Methods

  let (:languages) {Languages.new(Helper.create_mocked_api)}

  def app
    LanguagesController.new
  end

  before do
    LanguagesController.set :languages, languages
  end

  it "post /top returns ok response" do
    post "/top"
    expect(last_response).to be_ok
  end

  it "post /top displays top 3 languages" do
    post "/top"
    expected = "<p>Language: ruby Bytes: 6000</p>\n  <p>Language: python Bytes: 500</p>\n  <p>Language: html Bytes: 100</p>"
    expect(last_response.body).to include(expected)
  end

  it "post /top displays username in question" do
    post "/top", {:username => "willcurry"}
    expect(last_response.body).to include("willcurry")
  end

  it "post /top displays their favourite language" do
    post "/top", {:username => "willcurry"}
    expect(last_response.body).to include("ruby is their favourite")
  end
end
