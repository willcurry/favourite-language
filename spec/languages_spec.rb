require_relative "../lib/languages.rb"

RSpec.describe Languages do
  let (:api) {Helper.create_mocked_api}

  it "finds most used language" do
    languages = Languages.new(api)
    expect(languages.get_most_used("fake name")).to eq({:language => :ruby, :bytes => 6000})
  end
end
