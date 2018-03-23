require_relative '../lib/github_api.rb'
require_relative 'octokit_mock.rb'

RSpec.describe GitHubAPI do
  it "gets all repositories and returns an array of ids" do
    api = GitHubAPI.new(OctokitMock.new)
    expect(api.get_all_repository_ids("fake name")).to eq([1, 2, 3])
  end
end
