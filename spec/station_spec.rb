require 'station'

describe Station do

  subject(:station) {described_class.new(name: "Old Street", zone: 1)}
  it '#initializes with one' do
    expect(station.zone).to eq 1
  end

  it '#initializes with name' do
    expect(station.name).to eq "Old Street"
  end
end
