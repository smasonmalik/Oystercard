require 'oystercard'

describe Oystercard do
  it 'checks money on card' do
    expect(subject.balance).to eq 0
  end
end
