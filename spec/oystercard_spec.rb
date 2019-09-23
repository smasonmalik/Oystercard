require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  it 'checks money on card' do
    expect(oystercard.balance).to eq 0
  end
end
