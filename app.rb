require 'sinatra'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  @temp = params['temp'].to_s
  erb :temperature
end

get '/temperature' do
  @temp = params['temp'].to_s
  erb :temperature
end
