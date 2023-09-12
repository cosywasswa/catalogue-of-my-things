require 'json/add/date'
class Item
  attr_accessor :genre, :label, :author, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @genre = genre
    @author = author
    @publish_date = publish_date
    @archived = archived
    @label = []
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

  def add_a_label
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end
end
