require 'sinatra'
require 'ostruct'

set :bind, '0.0.0.0'
set :port, ENV['PORT'] || 4567

get '/' do
  # Головна сторінка відразу показує форму
  @temp = ""
  erb :temperature
end

get '/temperature' do
  # ВАЖЛИВО: використовуємо 'temp', бо так написано в name="temp" у твоєму HTML
  @temp = params['temp'] || ""
  erb :temperature
end
