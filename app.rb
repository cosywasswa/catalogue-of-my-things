require_relative 'menu'
require_relative 'classes/music_album'
require_relative 'classes/game'
require_relative 'classes/game_details'
require_relative 'classes/author'
class App
  attr_accessor :books, :music_albums, :genres, :games, :labels, :authors

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    @labels = []
    @authors = []
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music albums added. Please add some music albums.'
    else
      puts 'List of all music albums:'
      @music_albums.each do |album|
        puts "#{album.title} by #{album.artist}, Released: #{album.release_year}"
      end
    end
  end

  def list_all_genres
    puts 'Enter the genre to list music albums:'
    genre = gets.chomp

    matching_albums = @music_albums.select { |album| album.genre == genre }

    if matching_albums.empty?
      puts "No music albums found for the genre: #{genre}"
    else
      puts "Music albums in the #{genre} genre:"
      matching_albums.each do |album|
        puts "#{album.title} by #{album.artist}, Released: #{album.release_year}"
      end
    end
  end

  def add_music_album
    puts 'Enter the details of the music album:'
    print 'Title: '
    title = gets.chomp
    print 'Artist: '
    artist = gets.chomp
    print 'Genre: '
    genre = gets.chomp
    print 'Release Year: '
    release_year = gets.chomp.to_i

    music_album_info = {
      title: title,
      artist: artist,
      release_year: release_year,
      on_spotify: true,
      publish_date: Time.now.strftime('%Y-%m-%d'),
      genre: genre,
      archived: false
    }

    new_music_album = MusicAlbum.new(music_album_info)
    @music_albums << new_music_album

    puts 'Music album added successfully!'
  end

  def list_of_games
    if @games.empty?
        puts 'Oops! No available games, select 9 to add new game'
      else
        @games.each_with_index do |game, index|
            puts "#{index + 1} '#{game['game_name']}' by #{game['first_name']}"
        end
      end
  end

  def list_all_authors
    if @authors.empty?
        puts 'oops there are no authors'
    else
       @authors.each do |author|
        puts "'#{author['first_name']} #{author['last_name']}'"
       end
    end
  end

  def add_a_game
    print 'Enter game name: '
    game_name = gets.chomp

    print 'Enter author first_name: '
    first_name = gets.chomp

    print 'Enter author last_name: '
    last_name = gets.chomp

    print 'Enter the publish date [YYYY-MM-DD]: '
    publish_date = gets.chomp

    print 'Is it a multiplayer? [Y/N]: '
    player = gets.chomp.downcase
    multiplayer = true_or_false(player)

    print 'It was last played at [YYYY-MM-DD]: '
    last_played_at = gets.chomp

    Author.new(first_name, last_name)
    GameDetails.new(game_name, first_name, last_name, publish_date, multiplayer, last_played_at)


 store_to_array(game_name, first_name, last_name, publish_date, multiplayer, last_played_at)

    puts 'Game Created Successfully'
  end

  def store_to_array(game_name, first_name, last_name, publish_date, multiplayer, last_played_at)
    @authors << {
      'first_name' => first_name,
      'last_name' => last_name
    }

    @games << {
      'game_name' => game_name,
      'first_name' => first_name,
      'last_name' => last_name,
      'publish_date' => publish_date,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at
    }
  end

  def true_or_false(bool)
    case bool
    when 'y'
      true
    when 'n'
      false
    end
  end

  def exit_app
    puts 'Exiting the app. Goodbye!'
    exit
  end
end
