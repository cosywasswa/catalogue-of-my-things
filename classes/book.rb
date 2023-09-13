require_relative 'item'
require_relative 'label'
require 'json'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date, :label, :title

  def initialize(title, publisher, cover_state: 'good', publish_date: nil, archived: false)
    super(publish_date, archived: archived)
    @id = rand(0...1000)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
    @publish_date = publish_date
    @label = nil
  end

  def can_be_archived?
    super || (@archived && @cover_state != 'good')
  end
end
