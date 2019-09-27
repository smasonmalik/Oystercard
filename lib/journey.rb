class Journey

  attr_reader :current_journey, :in_journey

  PENALTY_FARE = 6
  MIN_FARE = 1

  def initialize
    @current_journey = {}
    @in_journey = false
    @journey_complete = nil
  end

  def start(entry_station)
    @entry_station = entry_station
    @current_journey[:entry_station] = entry_station
    @in_journey = true
  end

  def finish(station)
    @exit_station = station
    @current_journey[:exit_station] = station
    @in_journey = false
  end

  def journey_complete?
    if @current_journey.include?(:entry_station) && @current_journey.include?(:exit_station)
      true
    else false
    end
  end

  def fare
    journey_complete? ? fare_calculator : PENALTY_FARE
  end

  def fare_calculator
    1 + (@entry_station.zone - @exit_station.zone).abs
  end
end
