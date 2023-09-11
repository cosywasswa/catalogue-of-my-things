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

  def selection
    tasks = {
      1 => :list_all_books,
      2 => :list_all_music_albums,
      3 => :list_of_games,
      4 => :list_all_genres,
      5 => :list_all_labels,
      6 => :list_all_authors,
      7 => :add_a_book,
      8 => :add_a_music_album,
      9 => :add_a_game,
      10 => :exit_app,
      default: :invalid_option
    }
  end
end