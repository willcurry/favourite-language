require_relative "github_api.rb"

class Languages
  def initialize(github_api=GitHubAPI.new)
    @github_api = github_api
  end

  def get_most_used(username)
    language = most_used_languages_sorted(username).first
    {:language => language[0], :bytes => language[1]}
  end

  private

  def most_used_languages_sorted(username)
    languages = @github_api.get_all_languages_used(username)
    merge_languages(languages).sort_by {|key, value| value}.reverse
  end

  def merge_languages(languages)
    totals = Hash.new(0)
    languages.each do |language_hash| totals[language_hash[:language]] += language_hash[:bytes] end
    totals
  end
end
