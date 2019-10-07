require 'sinatra'

# set :port, 8080
set :bind, '0.0.0.0'

get '/host' do
  `hostname`
end
