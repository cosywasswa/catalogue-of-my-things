require_relative 'item'

class Genre
  attr_accessor :name, :music_albums

  def initialize(name)
    @name = name
    @music_albums = []
  end

  def add_item(item)
    item.genre = self
    @music_albums << item
  end
end
