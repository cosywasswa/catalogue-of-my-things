require_relative 'menu'
require_relative 'classes/music_album'
require_relative 'classes/music_genre'
require_relative 'classes/item'
class App
  attr_accessor :id, :books, :music_albums, :genres, :games, :labels, :authors

  def initialize
    @id = id
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
        puts "ID: #{album.id}, #{album.title} by #{album.artist},\nGenre: #{album.genre}, Released: #{album.release_year}"
      end
    end
  end

  def list_all_genres
    puts 'No genres added it yet.' if @genres.empty?
    puts 'List of all genres:'
    @genres.each do |genre|
      puts genre.name.capitalize
    end
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
    new_genre = Genre.new(genre_name)
    @genres << new_genre

    new_music_album = MusicAlbum.new(music_album_info)
    @music_albums << new_music_album

    puts 'Music album added successfully!'
  end

  def exit_app
    puts 'Exiting the app. Goodbye!'
    exit
  end
end
