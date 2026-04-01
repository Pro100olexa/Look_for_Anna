require 'sinatra'

get '/temperature' do
  # Sinatra сама знайде файл temperature.html.erb у папці views
  erb :temperature
end