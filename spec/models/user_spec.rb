require 'rails_helper'

describe User, type: :model do
  it "it access all key information" do
    raw_user = {
        username: "chantal66",
        provider: 'github',
        name: "Chantal Justamond",
        avatar_url: "https://avatars1.githubusercontent.com/u/24360249?v=3",
        company: "dream company",
        blog: "www.mypage.com",
        location: "world",
        email: "myemail@email.com",
        bio: "short and sweet bio",
        public_repos: 44,
        followers: 1,
        following: 3,
        token: ENV['client_id']
    }

    github_user = User.from_github(raw_user, raw_user['token'])

    expect(github_user.username).to eq("chantal66")
    expect(github_user.avatar_url).to eq("https://avatars1.githubusercontent.com/u/24360249?v=3")
    expect(github_user.name).to eq("Chantal Justamond")
    expect(github_user.bio).to eq("short and sweet bio")
    expect(github_user.company).to eq("dream company")
    expect(github_user.location).to eq("world")
    expect(github_user.blog).to eq("www.mypage.com")
    expect(github_user.email).to eq("myemail@email.com")
    expect(github_user.followers).to eq(1)
    expect(github_user.following).to eq(3)
    expect(github_user.public_repos).to eq(44)
  end
end