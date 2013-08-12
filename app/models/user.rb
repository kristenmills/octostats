class User

  attr_reader :user, :repos, :languages, :events
  # Creates a new user object based on user events
  #
  # @param username [String] the username that you are looking at
  # @param client [Octokit::Client] the octokit client
  def initialize(username, client)
    @client = client
    @user = @client.user(username)
    @repos = @client.repos(username)
    process_events @client.user_public_events(username)
    language_dist
  end

  # Processes the events so that the data is useful to us
  #
  # @params events [Array] and array of event objects.
  def process_events events
    @events = Hash.new

    # Organize the event based on type
    # http://developer.github.com/v3/activity/events/types/ lists event types.
    events.each do |event|
      @events[event.type] ||= Array.new
      @events[event.type] << event
    end
  end

  # Goes through the languages and makes a hash of how many repos you have
  # per language
  def language_dist
    @languages = Hash.new(0)
    @repos.each do |repo|
      @languages[repo.language] += 1
    end
  end

end