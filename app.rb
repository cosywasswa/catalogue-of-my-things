require_relative 'menu'
require_relative 'classes/music_album'
require_relative 'classes/music_genre'
require_relative 'classes/item'
require_relative 'classes/game'
require_relative 'classes/game_details'
require_relative 'classes/author'
require_relative 'classes/book_details'

class App
  attr_accessor :id, :books, :music_albums, :genres, :games, :labels, :authors, :book_details

  def initialize
    @books = []
    @music_albums = []
    @genres = []
    @games = []
    @labels = []
    @authors = []
    @book_details = BookDetails.new
    load_authors
    load_games
    load_music_albums
    load_genres
  end

  def list_all_music_albums
    if @music_albums.empty?
      puts 'No music albums added. Please add some music albums.'
    else
      puts 'List of all music albums:'
      @music_albums.each do |album|
        puts "#{album['title']} by #{album['artist']},\nGenre: #{album['genre']}, Released: #{album['release_year']}"
      end
    end
  end

  def list_all_genres
    puts 'No genres added it yet.' if @genres.empty?
    puts 'List of all genres:'
    genre_names = @genres.map { |genre| "'#{genre['name'].capitalize}'" }
    puts genre_names.join(', ')
  end

  def add_music_album
    puts 'Enter the details of the music album:'
    print 'Title: '
    title = gets.chomp
    print 'Artist: '
    artist = gets.chomp
    print 'Genre: '
    genre_name = gets.chomp
    print 'Release Year: '
    release_year = gets.chomp.to_i

    music_album_info = {
      title: title,
      artist: artist,
      release_year: release_year,
      on_spotify: true,
      publish_date: Time.now.strftime('%Y-%m-%d'),
      genre: genre_name,
      archived: false
    }
    Genre.new(genre_name)

    MusicAlbum.new(music_album_info)

    save_music_albums(title, artist, genre_name, release_year)
    save_genres(genre_name)

    puts 'Music album added successfully!'
  end

  def load_music_albums
    music_album_data = JSON.parse(File.read('./DATABASE/music_albums.json'))
    @music_albums = music_album_data
  rescue JSON::ParserError => e
    puts "Error parsing music_albums.json: #{e.message}"
  end

  def save_music_albums(title, artist, genre_name, release_year)
    @music_albums << {
      'title' => title,
      'artist' => artist,
      'genre' => genre_name,
      'release_year' => release_year
    }
    File.write('./DATABASE/music_albums.json', JSON.pretty_generate(@music_albums))
  end

  def load_genres
    genre_data = JSON.parse(File.read('./DATABASE/genres.json'))
    @genres = genre_data
  rescue JSON::ParserError => e
    puts "Error parsing genres.json: #{e.message}"
  end

  def save_genres(genre_name)
    @genres << {
      'name' => genre_name
    }
    File.write('./DATABASE/genres.json', JSON.pretty_generate(@genres))
  end

  def load_authors
    authors_data = JSON.parse(File.read('./DATABASE/author.json'))
    @authors = authors_data
  rescue JSON::ParserError => e
    puts "Error parsing author.json: #{e.message}"
  end

  def load_games
    games_data = JSON.parse(File.read('./DATABASE/games.json'))
    @games = games_data
  rescue JSON::ParserError => e
    puts "Error parsing games.json: #{e.message}"
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

  def book_detail(test)
    case test
    when 1
      @book_details.list_all_books
    when 2
      @book_details.list_labels
    when 3
      @book_details.add_a_book
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

    games_info = {
      game_name: game_name,
      first_name: first_name,
      last_name: last_name,
      publish_date: publish_date,
      multiplayer: multiplayer,
      last_played_at: last_played_at
    }

    Author.new(first_name, last_name)
    GameDetails.new(games_info)

    data = {
      'game_name' => game_name,
      'first_name' => first_name,
      'last_name' => last_name,
      'publish_date' => publish_date,
      'multiplayer' => multiplayer,
      'last_played_at' => last_played_at
    }

    store_to_array(data)

    puts 'Game Created Successfully'
  end

  def store_to_array(data)
    game_name = data['game_name']
    first_name = data['first_name']
    last_name = data['last_name']
    publish_date = data['publish_date']
    multiplayer = data['multiplayer']
    last_played_at = data['last_played_at']

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

    File.write('./DATABASE/author.json', JSON.pretty_generate(@authors))
    File.write('./DATABASE/games.json', JSON.pretty_generate(@games))
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
