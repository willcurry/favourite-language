class Repository
  def initialize(id)
    @id = id
  end

  def id
    @id
  end
end

class OctokitMock
  def list_repositories(username)
    [Repository.new(1), Repository.new(2), Repository.new(3)]
  end
end
