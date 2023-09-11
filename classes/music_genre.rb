require_relative 'item'

class Genre < Item
  attr_accessor :name, :music_albums

  def initialize(name)
    super()
    @name = name
    @music_albums = []
  end

  def add_item(item)
    item.genre = self
    @music_albums << item
  end
end
