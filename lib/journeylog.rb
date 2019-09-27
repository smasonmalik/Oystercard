# class Journeylog
#   attr_reader :log, :journey_class
#
#   def initialize(journey_class = Journey)
#     @journey_class = journey_class
#     @log = []
#   end
#
#   def start(entry_station)
#     @journey_class.start(entry_station)
#   end
#
#   def finish(exit_station)
#     @journey_class.finish(exit_station)
#   end
#
#   def history
#     @log << @journey_class.current_journey
#   end
#
# end
