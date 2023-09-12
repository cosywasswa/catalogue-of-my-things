require_relative '../classes/game'
require_relative '../classes/item'

describe Game do
  describe '#can_be_archived?' do
    it 'should return true if archived' do
      new_game = Game.new('2005-10-10', true, '2010-10-10')
      result = new_game.send(:can_be_archived?)
      expect(result).to be(true)
    end

    it 'should return false published less than 10 years' do
      new_game = Game.new('2019-01-10', true, '2020-02-10')
      result = new_game.send(:can_be_archived?)
      expect(result).to be(false)
    end
  end

  it 'should return the correct last_played_at date' do
    new_game = Game.new('2010-09-08', false, '2023-10-02')
    expect(new_game.last_played_at).to eq('2023-10-02')
  end

  it 'should return false if multiplayer is false' do
    new_game = Game.new('2010-09-08', false, '2023-10-02')
    expect(new_game.multiplayer).to be(false)
  end
end
