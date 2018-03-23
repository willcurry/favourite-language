require_relative '../lib/github_api.rb'
require_relative 'octokit_mock.rb'
require_relative 'repository_mock.rb'

RSpec.describe GitHubAPI do
  it "gets all repositories and returns an array of ids" do
    octokit_mock = OctokitMock.new([RepositoryMock.new(1), RepositoryMock.new(2), RepositoryMock.new(3)])
    api = GitHubAPI.new(octokit_mock)
    expect(api.get_all_repository_ids("fake name")).to eq([1, 2, 3])
  end

  it "gets all languages and returns a hash map key = language and value = bytes" do
    octokit_mock = OctokitMock.new([RepositoryMock.new(1)])
    api = GitHubAPI.new(octokit_mock)
    expected = [{:language=>:ruby, :bytes=>5000},
                {:language=>:ruby, :bytes=>1000},
                {:language=>:python, :bytes=>500}]
    expect(api.get_all_languages_used("fake name")).to eq(expected)
  end
end
