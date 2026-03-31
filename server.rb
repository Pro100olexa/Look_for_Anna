require 'webrick'
require 'erb'

# Налаштування сервера
server = WEBrick::HTTPServer.new(Port: 3000)

server.mount_proc '/' do |req, res|
  # Шлях до нашого файлу
  # Визначаємо, яку сторінку хоче користувач.
  # Якщо адреса просто "/", беремо "test", інакше беремо назву з адреси.
  page_name = req.path == "/" ? "test" : req.path.delete_prefix("/")

  # Додаємо розширення .html.erb до назви
  file_path = "#{page_name}.html.erb"

  if File.exist?(file_path)
    # Читаємо файл
    template = File.read(file_path)
    # Створюємо об'єкт ERB і обробляємо код Ruby всередині HTML
    renderer = ERB.new(template)

    res.body = renderer.result(binding)
    res.content_type = 'text/html; charset=utf-8'
  else
    res.body = "Помилка: Файл #{file_path} не знайдено в папці 'жоске ruby'!"
    res.content_type = 'text/html; charset=utf-8' # Цей рядок лікує кракозябри
    res.status = 404
  end
end

puts "Server running at http://127.0.0.1:3000"
trap('INT') { server.shutdown }
server.start