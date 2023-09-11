require 'spec_helper'
require_relative '../calc'

RSpec.describe '#add' do
  it 'returns a + b with the given method add' do
    expect(add(2, 3)).to eq(5)
  end
end
