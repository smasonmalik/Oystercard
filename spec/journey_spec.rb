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
end
