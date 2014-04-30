require './server'
require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

class PingTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  id = "123456"

  def test_it_acks_ping
    get "/ping/?id=#{id}"
    assert_equal '{"status":"true"}', last_response.body
  end

  def test_missing_dev_id
    get '/ping'
    # ma być błąd brakującego parametru
    assert_equal '{"status":"false"}', last_response.body
  end

  def test_bad_dev_id
    get "/ping/?id=#{id}4"
    #ma być zły format
    assert_equal '{"status":"false"}', last_response.body
  end

  def test_auth_err

    # dunno jak to zrobić
  end

end
