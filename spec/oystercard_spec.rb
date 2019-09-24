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

  describe "#deduct" do
    it "deducts momney from card" do
      oystercard.top_up(50)
      expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
    end
  end

  describe "#in_journey?" do
    it "creates a in_journey instance variable" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "touching in to set @journey to true" do
      subject.top_up(40)
      subject.touch_in
      expect(subject).to be_in_journey
      end
    end

  describe "#touch_out" do
    it "touching out sets in_journey to false" do
      subject.top_up(40)
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
