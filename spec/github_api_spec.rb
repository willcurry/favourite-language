require_relative '../lib/github_api.rb'
require_relative 'octokit_mock.rb'
require_relative 'repository_mock.rb'

RSpec.describe GitHubAPI do
  it "gets all repositories and returns an array of ids" do
    octokit_mock = OctokitMock.new([RepositoryMock.new(1, []), RepositoryMock.new(2, [])])
    api = GitHubAPI.new(octokit_mock)
    expect(api.get_all_repository_ids("fake name")).to eq([1, 2])
  end

  it "gets all languages and returns a hash map contains language and bytes" do
    repositories = [RepositoryMock.new(1, [[:ruby, 5000], [:python, 500]]), RepositoryMock.new(2, [[:ruby, 1000]])]
    api = GitHubAPI.new(OctokitMock.new(repositories))
    expected = [{:language=>:ruby, :bytes=>5000},
                {:language=>:python, :bytes=>500},
                {:language=>:ruby, :bytes=>1000}]
    expect(api.get_all_languages_used("fake name")).to eq(expected)
  end
end
