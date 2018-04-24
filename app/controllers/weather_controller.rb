class WeatherController < ApplicationController
  def index
    @weather = WeatherApi.new "London,uk"
  end
end
