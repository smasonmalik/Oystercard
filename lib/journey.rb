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
end



# attr_reader :current_journey
#
# def intialize
#   @current_journey = {}
# end
#
#
#
# def start(station)
#   @journey[:entry_station] = station
#   @in_journey = true
#
# end
#
# def finish(station)
#   @journey[:exit_station] = station
#   @in_journey = false
# end
#
