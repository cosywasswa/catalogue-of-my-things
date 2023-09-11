require_relative 'menu'
require_relative './classes/music_album'
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

  def exit_app
    puts 'Exiting the app. Goodbye!'
    exit
  end
end
