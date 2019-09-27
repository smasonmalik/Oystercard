require 'journey'

describe Journey do
  subject(:journey) { described_class.new }
  let(:entry_station) { double :entry_station }
  let(:exit_station) { double :exit_station }

  describe '#initialize' do
    it 'initializes with an empty hash' do
      expect(journey.current_journey).to be_empty
    end

    it 'in journey equal false on initialization' do
      expect(journey.in_journey).to eq false
    end
  end

  describe '#start' do
    it 'sets in_journey to true' do
      journey.start(entry_station)
      expect(journey.in_journey).to eq true
    end

    it 'stores entry station in current_journey' do
      journey.start(entry_station)
      expect(journey.current_journey).to include(:entry_station => entry_station)
    end
  end

  describe "finish" do
    it 'sets in_journey to false' do
      journey.finish(exit_station)
      expect(journey.in_journey).to eq false
    end

    it 'stores entry station in current_journey' do
      journey.finish(exit_station)
      expect(journey.current_journey).to include(:exit_station => exit_station)
    end
  end

  describe "journey_complete?" do
    it "checks touching in and out completes a journey" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.journey_complete?).to eq true
    end

    it "checks touching in and not out is an incomplete journey" do
      journey.start(entry_station)
      expect(journey.journey_complete?).to eq false
    end
  end


  describe "#fare" do
    it "deducts penalty fare if exit_station is empty" do
      journey.start(entry_station)
      expect(journey.fare).to eq Journey::PENALTY_FARE
    end

    it "deducts min_fare fare if journey is complete" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.fare).to eq Journey::MIN_FARE
    end
  end

  describe "#in_journey?" do
    it "creates a in_journey instance variable" do
      expect(subject.in_journey).to eq false
    end
  end

  it "finshing jourbney sets in_journey to false" do
    subject.start(entry_station)
    subject.finish(exit_station)
    expect(subject.in_journey).to eq false
  end
end
