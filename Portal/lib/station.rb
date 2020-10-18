class TrainStation
  include HTTParty
  format :json

  base_uri  'localhost:3001'

  
  #get all stations from API to display 
  def stations
    self.class.get("/v1/stations")
  end

  
  #pass station name and code params from Form to API 
  def createStation(station_name,station_code)
    headers =  {
        "Content-Type": "application/json",
        "Accept": "application/json"
    }
    station = {
        "station_name" => station_name,
        "station_code" => station_code
    }.to_json
   
        
    self.class.post("/v1/stations",:body => station,:headers => headers)

    
  end
  

  
  


  


end




