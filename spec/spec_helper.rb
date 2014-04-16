PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require 'simplecov'
SimpleCov.start
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

# You can use this method to custom specify a Rack app
# you want rack-test to invoke:
#
#   app Octostats::App
#   app Octostats::App.tap { |a| }
#   app(Octostats::App) do
#     set :foo, :bar
#   end
#
def app(app = nil, &blk)
  @app ||= block_given? ? app.instance_eval(&blk) : app
  @app ||= Padrino.application
end
