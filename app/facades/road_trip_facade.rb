class RoadTripFacade
  def self.get_route(origin, destination)
    time = RoadTripFacade.get_travel_time(origin, destination)
    seconds = RoadTripFacade.trip_route(origin, destination)
    weather = RoadTripFacade.destination_weather_eta(seconds, destination)
    RoadTrip.new(origin, destination, time, weather)
  end

  def self.destination_weather_eta(seconds, destination)
    arrival_time = (Time.now + seconds).strftime('%H %M %d')
    hourly = ForecastFacade.hourly_unlimited(destination)
    if seconds < 84600
      hours = hourly[0..23].find do |hour|
        hour.time[0..1] == arrival_time[0..1]
      end
    else
      hours = hourly[24..-1].find do |hour|
        hour.time[0..1] == arrival_time[0..1]
      end
    end
  end

  def self.trip_route(origin, destination)
    RoadTripService.get_route_service(origin, destination)[:route][:realTime]
  end

  def self.get_travel_time(origin, destination)
    response = RoadTripFacade.trip_route(origin, destination)

    day = 86400
    hour = 3600
    minute = 60
    @day_counter = 0
    @hour_counter = 0
    @minute_counter = 0

    while response - day > 0
      @day_counter += 1
      response = response -= day
    end

    while response - hour > 0
      @hour_counter += 1
      response = response -= hour
    end

    while response - minute > 0
      @minute_counter += 1
      response = response -= minute
    end
    "#{@day_counter} days, #{@hour_counter} hours, #{@minute_counter} minutes"
  end
end
