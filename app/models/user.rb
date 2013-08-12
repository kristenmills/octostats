class User

  attr_reader :user, :repos
  # Creates a new user object based on user events
  #
  # @param username [String] the username that you are looking at
  # @param client [Octokit::Client] the octokit client
  def initialize(username, client)
    @client = client
    @user = @client.user(username)
    @repos = @client.repos(username)
    process @client.user_public_events(username)
  end

  # Processes the events so that the data is useful to us
  #
  # @params events [Array] and array of event objects.
  def process events
    @events = Hash.new

    # Organize the event based on type
    # http://developer.github.com/v3/activity/events/types/ lists event types.
    events.each do |event|
      @events[event.type] ||= Array.new
      @events[event.type] << event
    end
  end

end