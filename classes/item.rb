require 'json/add/date'
class Item
  attr_accessor :id, :genre, :label, :author

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    @label = label
    @author = author
    @publish_date = publish_date
    @archived = archived
  end

  private

  def can_be_archived?
    @today = Date.today
    @date = Date.parse(@publish_date)
    ((@today - @date) / 365).floor > 10
  end

  public

  def move_to_archive
    @archived = true if can_be_archived?
    @archived
  end
end
