require 'sinatra'
require 'ostruct'

# Це критично важливо для Render:
# Встановлюємо порт з системної змінної або 4567 за замовчуванням
set :port, ENV['PORT'] || 4567
# Дозволяємо підключення ззовні (0.0.0.0 замість localhost)
set :bind, '0.0.0.0'

get '/' do
  "Сервер працює! Перейдіть на <a href='/temperature'>сторінку температури</a>"
end

get '/temperature' do
  @temp = params['temp']
  erb :temperature
end
