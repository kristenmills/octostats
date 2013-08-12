require 'sprockets'
require 'octokit'
module Octostats
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Sprockets
    register Padrino::Cache
    sprockets minify: (Padrino.env == :production)

    enable :sessions
    enable :caching

    error 404 do
      render 'errors/404'
    end

    error 500 do
      render 'errors/500'
    end
  end
end
