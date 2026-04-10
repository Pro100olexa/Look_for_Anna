require 'sinatra'
require 'ostruct'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  # Відразу показуємо сторінку температури як головну
  @temperature = params['temperature']
  erb :temperature
end

get '/temperature' do
  @temperature = params['temperature']
  erb :temperature
end
