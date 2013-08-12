class User

  attr_reader :username, :repos
  # Creates a new user object based on user events
  #
  # @param username [String] the username that you are looking at
  # @param client [Octokit::Client] the octokit client
  def initialize(username, client)
    @username = username
    @client = client
    @repos = @client.repos(username)
    process @client.user_public_events(username)
  end

  # processes the events
  def process events

  end

end