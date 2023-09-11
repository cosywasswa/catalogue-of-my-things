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
end
