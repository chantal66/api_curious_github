require 'rails_helper'

describe User, type: :model do
  it "it access all key information" do
    raw_user = {
      'login'        => "chantal66",
      'provider'     => 'github',
      'name'         => "Chantal Justamond",
      'uid'          => '15373991',
      'avatar_url'   => "https://avatars3.githubusercontent.com/u/15373991?v=4",
      'email'        => "cjustamm66@me.com",
      'token'        => ENV['token']
    }

    github_user = User.from_github(raw_user, raw_user['token'])

    expect(github_user.username).to eq("chantal66")
    expect(github_user.image_url).to eq("https://avatars3.githubusercontent.com/u/15373991?v=4")
    expect(github_user.name).to eq("Chantal Justamond")
    expect(github_user.email).to eq("cjustamm66@me.com")
  end
end