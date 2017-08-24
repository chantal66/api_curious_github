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
end
