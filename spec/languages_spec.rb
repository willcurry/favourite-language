require 'languages'

RSpec.describe Languages do
  let (:api) {Helper.create_mocked_api}

  it "returns top 3 used languages sorted" do
    languages = Languages.new(api)
    expected = [{:language=>:ruby, :bytes=>6000},
                {:language=>:python, :bytes=>500},
                {:language=>:html, :bytes=>100}]
    expect(languages.get_top_three("fake name")).to eq(expected)
  end
end
