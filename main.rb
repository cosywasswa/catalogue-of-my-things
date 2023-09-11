require_relative 'app'
require_relative 'menu'

def welcome
  puts 'Welcome to our catalogue of things'
  puts ''
end

def main
  welcome
  app = App.new
  menu = Menu.new(app)
  loop do
    menu.start
  end
end

main
