require 'github_util'

RSpec.describe GitHubUtil do
  it "knows whether or not a username is valid" do
    expect(GitHubUtil.valid_username?(" ")).to eq(false)
    expect(GitHubUtil.valid_username?("nwefoewnfjioernvjiernvijrenvjrkvnjnbjkrtnbjrnj")).to eq(false)
    expect(GitHubUtil.valid_username?("willcurry")).to eq(true)
  end
end
