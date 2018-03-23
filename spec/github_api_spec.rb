require_relative '../lib/github_api.rb'
require_relative 'octokit_mock.rb'
require_relative 'repository_mock.rb'

RSpec.describe GitHubAPI do
  let (:api) {Helper.create_mocked_api}

  it "gets all repositories and returns an array of ids" do
    expect(api.get_all_repository_ids("fake name")).to eq([1, 2])
  end

  it "gets all languages and returns a hash map contains language and bytes" do
    expected = [{:language=>:ruby, :bytes=>5000},
                {:language=>:python, :bytes=>500},
                {:language=>:ruby, :bytes=>1000},
                {:language=>:html, :bytes=>100},
                {:language=>:c, :bytes=>50}]
    expect(api.get_all_languages_used("fake name")).to eq(expected)
  end
end
