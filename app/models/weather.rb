class Weather
    require 'net/http'
    def initialize(host=nil)
        @host = host || "http://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=9cff8bd0c6c00e515774a4639a2b140e"
    end

    def fetch_data
        base_url = @host
        uri = URI.parse base_url
        http = Net::HTTP.new(uri.host, uri.port)

        request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
        p request.inspect
        # response = http.request(request)
        # response.body



        # resp_obj =  response_object response
    end

    private
    def response_object response
     p response.inspect
      response_hash = JSON.parse response
      Hashie::Mash.new response_hash
    end
end
