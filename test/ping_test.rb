ENV['RACK_ENV'] = 'test'

require 'charon-server/server'
require 'test/unit'
require 'rack/test'

class PingTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_acks_ping
    get '/ping'
    assert_equal '{"status": true}', last_response.body
  end

end