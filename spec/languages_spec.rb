require_relative "../lib/languages.rb"

RSpec.describe Languages do
  it "finds most used language" do
    repositories = [RepositoryMock.new(1, [[:ruby, 5000], [:python, 500]]), RepositoryMock.new(2, [[:ruby, 100]])]
    octokit_mock = OctokitMock.new(repositories)
    languages = Languages.new(GitHubAPI.new(octokit_mock))
    expect(languages.get_most_used("fake name")).to eq({:language => :ruby, :bytes => 5100})
  end
end
