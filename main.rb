require_relative 'app'
require_relative 'menu'

def welcome
  puts 'Welcome to our catalogue of things'
  puts ''
end

def main
  welcome
  App.new
  menu = Menu.new
  puts menu.options
end

main
