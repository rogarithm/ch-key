require "sinatra"
require 'json'
require_relative "./lib/runner"

get '/' do
  File.read(File.join('public', 'index.html'))
end

post '/transpositions' do
  r = Runner.new

  payload = JSON.parse(request.body.read)
  result = r.run(payload["text"], payload["from"], payload["to"])

  return {transposed: result}.to_json
end
