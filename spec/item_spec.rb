require_relative '../classes/item'

describe Item do
  it 'should be an instance of the class' do
    item = Item.new('2010-10-10')
    expect(item).to be_an_instance_of(Item)
  end

  describe '#can_be_archived?' do
    it 'returns true if publish_date if > 10 years' do
      item = Item.new('2009-02-10')
      result = item.send(:can_be_archived?)
      expect(result).to be(true)
    end
  end

  describe '#move_to_archive' do
    it 'should return false if can_be_archived is false' do
      item = Item.new('2019-10-09')
      result = item.move_to_archive
      expect(result).to be(false)
    end
  end
end
