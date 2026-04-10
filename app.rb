require 'sinatra'
require 'ostruct'

# Налаштування для Render
set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  "Сервер працює! Перейдіть на <a href='/temperature?temp=25'>сторінку температури</a>"
end

get '/temperature' do
  # Використовуємо .to_s, щоб уникнути помилок, якщо параметр порожній
  @temp = params['temp'].to_s 
  erb :temperature
end
