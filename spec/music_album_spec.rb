require 'spec_helper'
require_relative '../classes/music_album'

RSpec.describe MusicAlbum do
  let(:album_params) do
    {
      title: 'Album Title',
      author: 'Author Album',
      release_year: 2023,
      on_spotify: true,
      publish_date: '2023-01-01',
      archived: false
    }
  end

  subject { described_class.new(album_params) }

  describe '#can_be_archived?' do
    context 'when published more than 10 years ago and on Spotify' do
      it 'returns true' do
        album_params[:publish_date] = '2010-01-01'
        expect(subject.can_be_archived?).to be(true)
      end
    end

    context 'when not on spotify' do
      it 'return false' do
        album_params[:on_spotify] = false
        expect(subject.can_be_archived?).to be(false)
      end
    end

    context 'when published less than 10 years ago and on spotify' do
      it 'return false' do
        album_params[:publish_date] = '2020-01-01'
        expect(subject.can_be_archived?).to be(false)
      end
    end
  end
end
