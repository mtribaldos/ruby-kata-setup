
class Itinerary
  def initialize(origin, destiny)
    @origin = origin
    @destiny = destiny
    @stops = []
  end

  def completed?
    not_completed = @stops.reject { |stop| stop[:completed] }
    @origin[:completed] && @destiny[:completed] && not_completed.empty?
  end

  def add_stop(stop)
    @stops << stop
  end
end
