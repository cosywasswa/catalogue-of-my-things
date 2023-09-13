require_relative 'app'
class Menu
  def initialize(app)
    @app = app
  end

  def options
    puts 'Please choose an option by number:'
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List of games'
    puts '4 - List all genres'
    puts '5 - List all labels'
    puts '6 - List all authors'
    puts '7 - Add a book'
    puts '8 - Add a music album'
    puts '9 - Add a game'
    puts '10 - Exit app'
  end

  def start
    loop do
      options
      puts 'Enter a choice: '
      choice = gets.chomp.to_i

      case choice
      when 1
        @app.book_detail(1)
      when 2
        @app.list_all_music_albums
      when 3
        @app.list_of_games
      when 4
        @app.list_all_genres
      when 5
        @app.book_detail(2)
      when 6
        @app.list_all_authors
      when 7
        @app.book_detail(3)
      when 8
        @app.add_music_album
      when 9
        @app.add_a_game
      when 10
        @app.exit_app
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end
end
