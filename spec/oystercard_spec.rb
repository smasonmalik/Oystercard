require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }
  let(:journey){ {:entry_station => entry_station, :exit_station => exit_station} }

  it 'checks money on card' do
    expect(oystercard.balance).to eq 0
  end

  it "creates empty journey history on intialisation" do
    expect(subject.history).to be_empty
  end

  it "stores the entry station to journey history" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journey).to eq ({:entry_station => entry_station, :exit_station => exit_station})
  end

  it "stores journey to history" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.history).to include(journey)
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

    it 'stores an entry station' do
      oystercard.top_up(10)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
  end
  #deduct method no longer tested as it is a private method

  # describe "#deduct" do
  #   it "deducts momney from card" do
  #     oystercard.top_up(50)
  #     expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
  #   end
  # end

  describe "#in_journey?" do
    it "creates a in_journey instance variable" do
      expect(subject).not_to be_in_journey
    end
  end

  describe "#touch_in" do
    it "touching in to set @journey to true" do
      subject.top_up(40)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
      end
    end

  describe "#touch_out" do
    it "touching out sets in_journey to false" do
      subject.top_up(40)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
    it "deducts minimum fare from balance when touching out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect{subject.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::MIN_BALANCE)
    end

    it "forgets a entry station upon checking out" do
      subject.top_up(10)
      subject.touch_in('kingsx')
      subject.touch_out(exit_station)
      expect(subject.entry_station).to eq nil
    end
  end

  context "insufficient balance to travel" do
    it "throws error if insufficent balance" do
      expect { subject.touch_in(entry_station) } .to raise_error "Balance below minimum of #{Oystercard::MIN_BALANCE}"
    end
  end
end
