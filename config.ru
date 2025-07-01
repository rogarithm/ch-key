require "./app"
enable :logging
set :environment, :production
set :port, 9292
run Sinatra::Application
