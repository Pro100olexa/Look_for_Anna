require 'webrick'
require 'erb'

# Динамічне налаштування порту для Render
port = ENV['PORT'] || 3000
server = WEBrick::HTTPServer.new(Port: port)

server.mount_proc '/' do |req, res|
  # Визначаємо ім'я файлу (якщо шлях "/", відкриваємо test)
  page_name = req.path == "/" ? "test" : req.path.delete_prefix("/")
  
  # Додаємо розширення
  file_path = "#{page_name}.html.erb"

  if File.exist?(file_path)
    template = File.read(file_path)
    # Обробляємо ERB
    renderer = ERB.new(template)
    
    res.body = renderer.result(binding)
    res.content_type = 'text/html; charset=utf-8'
  else
    res.status = 404
    res.body = "Помилка: Файл #{file_path} не знайдено!"
    res.content_type = 'text/html; charset=utf-8'
  end
end

puts "Server running on port #{port}"
trap('INT') { server.shutdown }
server.start
