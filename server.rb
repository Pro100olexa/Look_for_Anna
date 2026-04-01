require 'bundler/setup'
require 'webrick'
require 'erb'

# Далі весь твій код, який ми писали минулого разу:
port = ENV['PORT'] || 3000
server = WEBrick::HTTPServer.new(Port: port, BindAddress: '0.0.0.0')

server.mount_proc '/' do |req, res|
  page_name = req.path == "/" ? "test" : req.path.delete_prefix("/")
  file_path = "#{page_name}.html.erb"

  if File.exist?(file_path)
    template = File.read(file_path)
    renderer = ERB.new(template)
    res.body = renderer.result(binding)
    res.content_type = 'text/html; charset=utf-8'
  else
    res.status = 404
    res.body = "Файл #{file_path} не знайдено!"
    res.content_type = 'text/html; charset=utf-8'
  end
end

puts "Server started on port #{port}"
trap('INT') { server.shutdown }
server.start
