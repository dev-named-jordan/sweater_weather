class RoadTripFacade
  def self.get_route(origin, destination)
    response = RoadTripService.get_route(origin, destination)
require "pry"; binding.pry    
    RoadTrip.new(from, to)
  end
end
