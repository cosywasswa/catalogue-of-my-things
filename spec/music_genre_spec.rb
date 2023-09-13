require 'spec_helper'
require_relative '../classes/music_genre'

RSpec.describe Genre do
    let(:genre) {Genre.new('Jalloh')}
    describe '#initialize' do
        it 'returns the correct_name of the genre in music Albums' do
            expect(genre.name).to eq('Jalloh')
        end
    end
end