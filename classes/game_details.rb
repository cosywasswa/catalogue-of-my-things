require_relative 'game'

class GameDetails < Game
  @games = []

  attr_accessor :game_name, :first_name, :last_name

  def initialize(params)
    super(params[:publish_date], params[:multiplayer], params[:last_played_at])
    @game_name = params[:game_name]
    @first_name = params[:first_name]
    @last_name = params[:last_name]


    self.class.games << self
  end

  class << self
    attr_reader :games
  end
end
