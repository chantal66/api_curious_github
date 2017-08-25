class HomeController < ApplicationController
  # before_action :authorize!

  def index
    @followers = User.get_followers(current_user)
    @followings = User.get_following(current_user)
  end
end