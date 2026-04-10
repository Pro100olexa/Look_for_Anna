require 'sinatra'
require 'ostruct' # Додай цей рядок обов'язково

set :server, 'webrick' # Це допоможе стабілізувати запуск
set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  "Сервер працює! Перейдіть на <a href='/temperature'>сторінку температури</a>"
end

get '/temperature' do
  @temp = params['temp'] 
  erb :temperature
end
