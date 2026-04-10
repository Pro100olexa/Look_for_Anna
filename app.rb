require 'sinatra'
require 'ostruct'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  erb :temperature
end

get '/temperature' do
  # Беремо значення з URL і кладемо в ПЕРЕМІННУ @temp
  @temp = params['temp'].to_s
  erb :temperature
end
