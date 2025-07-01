ENV['APP_ENV'] = 'test'

require "minitest/autorun"
require "rack/test"
require "json"
require_relative "../app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_getting_request
    post('/transpositions',
         { "from": "C", "to": "E", "text": "C G Am\n가사입니다" }.to_json,
         { 'CONTENT_TYPE' => 'application/json' })
    assert_equal "{\"transposed\":\"E B C#m\\n가사입니다\"}", last_response.body
  end
end
