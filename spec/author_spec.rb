require_relative '../classes/item'
require_relative '../classes/author'

describe Author do
  it 'should create an instance of  Author class' do
    new_author = Author.new('Cosmas', 'Wasswa')
    expect(new_author).to be_an_instance_of(Author)
  end
  describe '#add-item' do
    it 'should correctly add an item' do
      item = Item.new('2023-09-12')
      author = Author.new('Cosmas', 'Wasswa')
      author.add_item(item)
      expect(author.items.length).to eq(1)
    end
  end
end
