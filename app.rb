require 'sinatra'

set :bind, '0.0.0.0'
port = ENV['PORT'] || 4567
set :port, port

get '/temperature' do
  # params працює ТІЛЬКИ тут. 
  # Якщо на сторінці буде помилка, значить треба перевірити файл .erb
  erb :temperature
end

get '/users' do
  erb :users
end

get '/' do
  "Сервер запущено! Перейдіть на /temperature"
end
