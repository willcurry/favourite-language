class OctokitMock
  def initialize(repositories)
    @repositories = repositories
  end

  def list_repositories(username)
    @repositories
  end

  def languages(repository_name)
    [[:ruby, 5000], [:ruby, 1000], [:python, 500]]
  end
end
