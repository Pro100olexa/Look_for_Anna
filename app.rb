require 'sinatra'
require 'ostruct'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  # Використовуємо порожній рядок, щоб уникнути помилок при першому заході
  @temperature = ""
  erb :temperature
end

get '/temperature' do
  @temperature = params['temperature'] || ""
  erb :temperature
end
