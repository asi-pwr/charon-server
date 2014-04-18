ENV['RACK_ENV'] = 'test'

require './server'
require 'minitest/autorun'
require 'rack/test'

class PingTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_acks_ping
    get '/ping'
    assert_equal '{"status":"true"}', last_response.body
  end

end
