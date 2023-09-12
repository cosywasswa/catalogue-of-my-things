require_relative 'game'

class GameDetails < Game
  @@games = []

  attr_accessor :game_name, :first_name, :last_name

  def initialize(game_name, first_name, last_name, publish_date, multiplayer, last_played_at)
    super(publish_date, multiplayer, last_played_at)
    @game_name = game_name
    @first_name = first_name
    @last_name = last_name

    @@games << self
  end

  def self.list_games
    @@games
  end
end
