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

  def list_all_books
    puts 'Book is empty'
  end
end
