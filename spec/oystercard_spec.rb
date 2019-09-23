require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
  it 'checks money on card' do
    expect(oystercard.balance).to eq 0
  end

  describe '#add_money' do
    it 'adds amount to card' do
      oystercard.top_up(10)
      expect(oystercard.balance).to eq 10
    end

    it 'limits the balance to 90' do
      max_balance = Oystercard::MAX_BALANCE
      subject.top_up(max_balance)
      expect(oystercard.top_up(1)).to eq "card has balance limit of £#{Oystercard::MAX_BALANCE}"
    end
  end
end
