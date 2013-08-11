require 'sprockets'
require 'octokit'
module Octostats
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Sprockets
    sprockets minify: (Padrino.env == :production)

    enable :sessions


    before do
      # Set's up an new octokit client with client id and client secret so we can
      # do unauth requests with the higher rate limit
      @client = Octokit::Client.new(auto_traversal: true,
                                    client_id: ENV['OCTOSTATS_KEY'],
                                    client_secret: ENV['OCTOSTATS_SECRET'])
    end

    get '/' do
      render 'index'
    end

    get '/:username' do
      @username = params[:username]
      begin
        @client.user(@username)
        render 'user/show'
      rescue
        render 'user/notfound'
      end
    end

    get '/:username/:repo' do
      @username = params[:username]
      @repo = params[:repo]
      begin
        @client.repo("#{@username}/#{@repo}")
        render 'repo/show'
      rescue
        render 'repo/notfound'
      end
    end

    error 404 do
      render 'errors/404'
    end

    error 500 do
      render 'errors/500'
    end
  end
end
