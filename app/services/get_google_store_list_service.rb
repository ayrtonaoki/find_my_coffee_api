require 'rest-client'
require 'json'

class GetGoogleStoreListService
  KEY = "#{Rails.application.credentials.google_secret_key}"
  RADIUS = 5000

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def call
    begin
      location = "#{@latitude},#{@longitude}"
      base_url = "https://maps.googleapis.com/maps/api/place/textsearch/json?query=coffee+shops&location=#{location}&radius=#{RADIUS}&key=#{KEY}"

      response = RestClient.get(base_url)

      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse
      e.response
    end
  end
end
