ENV['RACK_ENV'] = 'test'

require 'controllers/application_controller'
require 'rack/test'

RSpec.describe ApplicationController do
  include Rack::Test::Methods

  def app
    ApplicationController.new
  end

  it "returns ok response and form is present" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("<form")
  end
end
