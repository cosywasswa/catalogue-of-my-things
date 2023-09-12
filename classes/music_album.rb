require_relative 'item'
class MusicAlbum < Item
  attr_accessor :id, :title, :artist, :release_year, :on_spotify, :genre

  def initialize(params)
    super(params[:publish_date], archived: params[:archived])
    @id = Random.rand(1..1000)
    @title = params[:title]
    @artist = params[:artist]
    @release_year = params[:release_year]
    @on_spotify = params[:on_spotify]
    @genre = params[:genre]
  end

  def can_be_archived?
    super && @on_spotify
  end
end
