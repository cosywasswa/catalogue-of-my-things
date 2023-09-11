require_relative 'app'

App.new
class Menu
  def options
    puts 'Please choose an option by number:
        1 - List all books
        2 - List all music albums
        3 - List of games
        4 - List all genres
        5 - List all labels
        6 - List all authors
        7 - Add a book
        8 - Add a music album
        9 - Add a game
        10 - Exit app'
  end
  menu = Menu.new
  loop do
    menu.options
    puts 'Enter a choice: '
    choice = gets.chomp.to_i

    case choice
    when 1
      app.list_all_books
    when 2
      list_all_music_albums
    when 3
      list_of_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    when 7
      add_a_book
    when 8
      add_a_music_album
    when 9
      add_a_game
    when 10
      exit_app
      break
    else
      'Invalid choice'
    end
  end
end
