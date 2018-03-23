class RepositoryMock
  def initialize(id, languages)
    @id = id
    @languages = languages
  end

  def id
    @id
  end

  def languages
    @languages
  end
end
