require 'sinatra'

# Це важливо для Render, щоб він розумів, куди надсилати трафік
set :bind, '0.0.0.0'
port = ENV['PORT'] || 4567
set :port, port

get '/temperature' do
  # Змінна params працює ТІЛЬКИ всередині цього блоку get
  erb :temperature
end

get '/' do
  "Сервер працює! Перейдіть на /temperature"
end
