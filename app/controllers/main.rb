Octostats::App.controller do

  configure do
    Octokit.auto_traversal = true
    Octokit.client_id = ENV['OCTOSTATS_KEY']
    Octokit.client_secret = ENV['OCTOSTATS_SECRET']
  end

  before do
    @client = Octokit::Client.new
  end

  get :index do
    render 'index'
  end

  get :index, with: :username do
    @username = params[:username]
    begin
      @client.user(@username)
      render 'user/show'
    rescue
      render 'errors/notfound'
    end
  end

  get :index, with: [:username, :repo] do
    @username = params[:username]
    @repo = params[:repo]
    begin
      @client.repo("#{@username}/#{@repo}")
      render 'repo/show'
    rescue
      render 'errors/notfound'
    end
  end
end