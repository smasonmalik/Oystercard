require 'oystercard'

describe Oystercard do

  # Create doubles of journey and Journey class
  let(:journey) { double :a_single_journey }
  # let(:journey_class) { double :journey_class, new: journey }

  subject(:oystercard) { described_class.new(journey) }
  let(:entry_station){ double :station }
  let(:exit_station){ double :station }


  # Expected contents of journey.history after a complete journey
  let(:journey_hash){ {:entry_station => entry_station, :exit_station => exit_station} }


  it 'checks money on card' do
    expect(oystercard.balance).to eq 0
  end

  it "creates empty journey history on intialisation" do
    expect(subject.history).to be_empty
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


  describe "#touch_in" do
    it "throws error if insufficent balance" do
      expect { subject.touch_in(entry_station) } .to raise_error "Balance below minimum of #{Oystercard::MIN_BALANCE}"
    end
  end

  describe "#touch_out" do

    it "deducts minimum fare from balance when touching out" do
      subject.top_up(10)
      allow(journey).to receive(:start)
      subject.touch_in(entry_station)
      allow(journey).to receive(:finish)
      allow(journey).to receive(:current_journey)
      expect{subject.touch_out(exit_station)}.to change{oystercard.balance}.by (-Oystercard::MIN_BALANCE)
    end

    it "stores journey to history" do
      subject.top_up(10)
      allow(journey).to receive(:start).with(entry_station)
      allow(journey).to receive(:finish).with(exit_station)
      allow(journey).to receive(:current_journey) { journey_hash }
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.history).to include(journey_hash)
    end
  end
end
