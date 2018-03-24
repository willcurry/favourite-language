require 'languages'

RSpec.describe Languages do
  it "returns top 3 used languages sorted" do
    api = Helper.create_mocked_api
    languages = Languages.new(api)
    expected = [{:language=>:ruby, :bytes=>6000},
                {:language=>:python, :bytes=>500},
                {:language=>:html, :bytes=>100}]
    expect(languages.get_top_three("fake name")).to eq(expected)
  end

  it "raises error when user has no repositories" do
    api = GitHubAPI.new(OctokitMock.new([]))
    languages = Languages.new(api)
    expect{languages.get_top_three("fake name")}.to raise_exception("No repositories found")
  end
end
