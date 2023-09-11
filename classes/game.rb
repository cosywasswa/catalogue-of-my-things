require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    @now = Date.today
    @date = Date.parse(@last_played_at)
    @last_played = ((@now - @date) / 365).floor
    supper && @last_played > 2
  end
end
