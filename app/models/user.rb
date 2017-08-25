class User < ApplicationRecord
  def self.from_github(data, access_token)
    user = User.find_or_create_by(uid: data['id'], provider: 'github')
    user.username  = data['login']
    user.name      = data['name']
    user.email     = data['email']
    user.image_url = data['avatar_url']
    user.token     = access_token
    user.save
    user

  end

  def get_following
    get_url("https://api.github.com/users/#{current_user.username}/following")
  end

  def self.get_following(current_user)
    new(current_user).get_following

  end
end
