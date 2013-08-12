Octostats::App.controller do

  configure do
    Octokit.auto_paginate = true
    Octokit.client_id = ENV['OCTOSTATS_KEY']
    Octokit.client_secret = ENV['OCTOSTATS_SECRET']
  end

  before do
    @client = Octokit::Client.new
  end

  get :index do
    render 'index'
  end

  get :index, with: :username, cache: true do
    expires_in 3600
    begin
      # render 'shared/loading'
      @user = User.new(params[:username], @client)
      render 'user/show'
    rescue Octokit::NotFound
      render 'errors/notfound'
    end
  end

  get :index, with: [:username, :repo] do
    @username = params[:username]
    @repo = params[:repo]
    begin
      @client.repo("#{@username}/#{@repo}")
      render 'repo/show'
    rescue Octokit::NotFound
      render 'errors/notfound'
    end
  end
end