class Label
  attr_accessor :title, :color
  attr_reader :id, :items

  def initialize(title, color)
    @id = rand(0...1000)
    @title = title
    @color = color
    @items = []
    @item = nil
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def to_json(*_args)
    {
      title: @title,
      color: @color
    }.to_json
  end

  def self.from_json(json_data)
    data = JSON.parse(json_data)
    new(
      data['title'],
      data['color']
    )
  end
end
