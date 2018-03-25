class GitHubUtil
  def self.valid_username?(username)
    !username.nil? && username.length > 5 && username.length < 33
  end
end
