require 'sinatra'

get '/' do
  # Це змусить Sinatra відкрити твій файл і дасть йому об'єкт params
  erb :index 
end
