require 'sinatra'
require 'ostruct'

# Налаштування для Render
set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

# Головна сторінка
get '/' do
  "Сервер працює! Перейдіть на <a href='/temperature?temp=25'>сторінку температури</a>"
end

# Сторінка температури
get '/temperature' do
  # Безпечне отримання параметра
  @temp = params && params['temp'] ? params['temp'].to_s : "не вказана"
  
  begin
    erb :temperature
  rescue StandardError => e
    "Помилка у файлі шаблону: #{e.message}"
  end
end
