class UserHelper
  def self.gravatar_url user
    "http://www.gravatar.com/avatar/#{user.user.gravatar_id}?s=150"
  end
end