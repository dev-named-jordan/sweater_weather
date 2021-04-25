class Background

  attr_reader :location, :url, :credit

  def initialize(location, background)
    @location = location
    @url = background[:results][0][:links][:html]
    @credit = nest_credit(background)
  end

  def nest_credit(background)
    {
      source: "unsplash.com",
      author: background[:results][0][:user][:name]
    }
  end
end
