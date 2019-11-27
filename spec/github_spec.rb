RSpec.describe Github do
  let(:user_response) {
    VCR.use_cassette("github/user") {
      github = Github.new
      github.user("prasannaboga")
    }
  }


  it "has a base url" do
    github = Github.new
    expect(github.base_url).to eq('https://api.github.com')
  end

  it "can fetch & parse user data" do
    expect(user_response).to be_kind_of(Hash)

    expect(user_response).to have_key(:id)
    expect(user_response).to have_key(:type)
  end
end
