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

    error 404 do
      render 'errors/404'
    end

    error 500 do
      render 'errors/500'
    end
  end
end
