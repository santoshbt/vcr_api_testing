require 'test_helper'

class WeatherApiTest < ActiveSupport::TestCase
  def setup
    VCR.use_cassette('london_weather') do
      @weather =  WeatherApi.new "London,uk"
    end
  end

  test 'it should return temperature' do
      assert_equal 280.32, @weather.temperature
  end

  test 'it should return weather conditions' do
    weather_condition = @weather.weather_conditions[0]['main']
    assert_equal 'Rain', weather_condition['main']
    assert_equal 'lignt intensity shower rain', weather_condition['description']
  end
end
