class Station
  include HTTParty
  base_uri 'localhost:3001/v1'

  def stations
  	self.class.get("/stations")
  end

  def create_station
    headers =  {
        "Content-Type": "application/json",
        "Accept": "application/json"
    }
    station_params = {
        "station_name" => "station_name",
        "station_code" => "station_code"
    }.to_json

  	self.class.post("/stations",
		:body => station_params,
		:headers => headers
    )
  end
end

