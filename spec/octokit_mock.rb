class OctokitMock
  def initialize(repositories)
    @repositories = repositories
  end

  def list_repositories(username)
    @repositories
  end

  def languages(repository_id)
    @repositories.find {|repository| repository.id == repository_id}.languages
  end
end
