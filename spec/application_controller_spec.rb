ENV['RACK_ENV'] = 'test'

require_relative '../lib/controllers/application_controller'
require 'rack/test'

RSpec.describe ApplicationController do
  include Rack::Test::Methods

  def app
    ApplicationController
  end

  it "displays title on / route" do
    get "/"
    expect(last_response).to be_ok
    expect(last_response.body).to include("<h3>GitHub Favourite Language</h3>")
  end
end
