require 'sinatra'

# Налаштування для Render
set :bind, '0.0.0.0'
port = ENV['PORT'] || 4567
set :port, port

get '/' do
  "Сервер працює! Перейдіть на <a href='/temperature'>сторінку температури</a>"
end

get '/temperature' do
  # Змінна params працює ТІЛЬКИ тут, коли користувач відкриває сторінку
  @temp = params['temp'] 
  erb :temperature
end
