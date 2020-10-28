class Station<ApplicationRecord
	include HTTParty
    require 'csv'

    base_uri 'localhost:3001'
   
      
    #get all stations
    def self.all_stations 
      get("/v1/stations")
    end
    
    #init new station not important
    def self.new_station
    	get(base_uri)
    end

     #create station. Parent exisit must !
    def self.create_station(station_name,station_code,trainline_id)
      headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
      }

       station = {
          "trainline_id" => trainline_id.to_s,
          "station_name" => station_name,
          "station_code" => station_code
      }.to_json
      post("/v1/stations",:body => station,:headers => headers)
    end



    #import csv
    def self.import(file)
      
      CSV.foreach(file.path, headers: true) do |row|
        
        headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
       station = {
          "station_name" => station_name,
          "station_code" => station_code
      }.to_json
        #puts "------#{row}------"
        post("/v1/stations",:body => trainline,:headers => headers)
      end
    end

   
    def self.find_station(id)
    	 get("/v1/stations/#{id}")
    end

    def self.update_station(station_name,station_code,trainline_id,id)
    	headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
      }

      
       station = {
          "trainline_id" => trainline_id.to_s,
          "station_name" => station_name,
          "station_code" => station_code
      }.to_json
      patch("/v1/stations/#{id}",:body => station,:headers => headers)

    end

    def self.destroy_station(id)
    	headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        trainline = {
          "id" => id
        }.to_json
      delete("/v1/stations/#{id}",:body => trainline,:headers => headers)

    end

    	
    
end

