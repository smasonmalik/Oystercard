class Journey

  attr_reader :current_journey, :in_journey

  def initialize
    @current_journey = {}
    @in_journey = false
  end

  def start(entry_station)
    @current_journey[:entry_station] = entry_station
    @in_journey = true
  end

  def finish(station)
    @current_journey[:exit_station] = station
    @in_journey = false
  end
end
