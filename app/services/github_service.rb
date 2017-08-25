class GithubService

  attr_reader :current_user

  def initialize(user)
    @current_user = user

    @conn = Faraday.new(url: "https://api.github.com") do |faraday|
      faraday.headers["X-API-KEY"] = ENV["client_id"]
      faraday.adapter Faraday.default_adapter
    end
    binding.pry
  end

  def get_url(url)
    response = @conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_following
    get_url("https://api.github.com/users/#{current_user.username}/following")
  end

  def self.get_following(current_user)
    new(current_user).get_following
  end

  def get_followers
    get_url("https://api.github.com/users/#{current_user.username}/followers")
  end

  def get_followers(current_user)
    new(current_user).get_followers
  end

end