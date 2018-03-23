require 'octokit'

class GitHubAPI
  def initialize(client=Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"]))
    @client = client
  end

  def get_all_repository_ids(username)
    @client.list_repositories("willcurry").map {|repository| repository.id}
  end
end
