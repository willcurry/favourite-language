ENV['RACK_ENV'] = 'test'

require 'controllers/languages_controller'
require 'rack/test'
require 'json'

RSpec.describe LanguagesController do
  include Rack::Test::Methods

  let (:languages) {Languages.new(Helper.create_mocked_api)}

  def app
    LanguagesController.new
  end

  before do
    LanguagesController.set :languages, languages
  end

  describe "POST /top" do
    it "returns ok response" do
      post "/top", {:username => "willcurry"}
      expect(last_response).to be_ok
    end

    it "displays top 3 languages" do
      post "/top", {:username => "willcurry"}
      expect(last_response.body).to include("ruby")
      expect(last_response.body).to include("python")
      expect(last_response.body).to include("html")
    end

    it "displays username in question" do
      post "/top", {:username => "willcurry"}
      expect(last_response.body).to include("willcurry")
    end

    it "displays their favourite language" do
      post "/top", {:username => "willcurry"}
      expect(last_response.body).to include("ruby is their favourite")
    end

    it "displays actual number of repositories if its less then 3" do
      repositories = [RepositoryMock.new(1, [[:ruby, 5000], [:python, 500]])]
      api = GitHubAPI.new(OctokitMock.new(repositories))
      languages = Languages.new(api)
      LanguagesController.set :languages, languages
      post "/top", {:username => "willcurry"}
      expect(last_response.body).to include("Top 2")
    end

    context "error webpages" do
      it "displays invalid name error page if username is invalid" do
        post "/top", {:username => "w "}
        expect(last_response.body).to include("invalid username")
        post "/top", {:username => "wdjjjjjjjjjjjjeiiiwijfoiwjvrneivnjornjgnbjngjobnrobnrobnrjbnrojbnjronbojrnbojrno"}
        expect(last_response.body).to include("invalid username")
      end

      it "displays no data error page if user has no repositories" do
        languages = Languages.new(Helper.create_api_with_no_repositories)
        LanguagesController.set :languages, languages
        post "/top", {:username => "willcurry"}
        expect(last_response.body).to include("has no public repositories")
      end
    end
  end
end
