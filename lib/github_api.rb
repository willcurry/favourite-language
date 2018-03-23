require 'octokit'

class GitHubAPI
  def initialize(client=Octokit::Client.new(:access_token => ENV["GITHUB_ACCESS_TOKEN"]))
    @client = client
  end

  def get_all_repository_ids(username)
    @client.list_repositories("willcurry").map {|repository| repository.id}
  end

  def get_all_languages_used(username)
    repositories = get_all_repository_ids(username)
    repositories.map {|id| get_languages(id) }.first
  end

  def get_languages(repository_id)
    @client.languages(repository_id).map {|language, bytes| {:language => language, :bytes => bytes}}
  end
end
