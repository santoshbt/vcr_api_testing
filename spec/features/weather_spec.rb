require 'rails_helper'
require 'vcr'

describe '.current_data' do
  before do
    VCR.use_cassette('london_weather') do
      @weather =  WeatherApi.new "London,uk"
    end
  end

  it 'should return temperature' do
      expect(@weather.temperature).to eq(280.32)
  end

  it 'should return weather conditions' do
    weather_condition = @weather.weather_conditions[0]
    expect(weather_condition['main']).to eq('Drizzle')
    expect(weather_condition['description']).to eq('light intensity drizzle')
  end
end
