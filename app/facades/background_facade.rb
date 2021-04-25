class BackgroundFacade
  def self.get_background(location)
    response = BackgroundService.get_location(location)
    Background.new(location, response)
  end
end
