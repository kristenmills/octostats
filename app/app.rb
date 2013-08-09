require 'sprockets'
module Octostats
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Mailer
    register Padrino::Helpers
    register Padrino::Sprockets
    sprockets :minify => (Padrino.env == :production)

    enable :sessions

    get '/' do
      render 'index'
    end

    get '/:username' do
      render 'user/show'
    end

    get '/:username/:repo' do
      render 'repo/show'
    end

    error 404 do
      render 'errors/404'
    end
  end
end
