class Transit<ApplicationRecord
  include HTTParty
  require 'csv'

  base_uri 'localhost:3001'
   
      
  #get all chages to / all transit lines
    def self.all_transit_line 
      get("/v1/stations/transits")
    end
    
  #init new changes_to/transit lines not important
    def self.new_transit_line
    	get(base_uri)
    end

  #create transit lines. Parent exisit must !
    def self.create_transit_line(station_id,changes_to)
      headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
      }

       transit_line = {
          "station_id" => station_id,
          "changes_to" => changes_to,
          
      }.to_json
      post("/v1/stations/transits",:body => transit_line,:headers => headers)
    end
    
  #import csv
    def self.import(file)
      
      CSV.foreach(file.path, headers: true) do |row|
        
        headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        trainline = {
          "line_name" => row[0],
          
        }.to_json
        #puts "------#{row}------"
        post("/v1/stations/transits",:body => trainline,:headers => headers)
      end
    end
  
  #find_by id 
    def self.find_transit_line(id)
    	 get("/v1/stations/transits/#{id}")
    end
  
  #update trainline params, currently ID should pass into controller action to work.
    def self.update_transit_line(line_name,id)
    	headers =  {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
      transit_line = {
          "line_name" => line_name
      }.to_json
      patch("/v1/stations/transits/#{id}",:body => transit_line,:headers => headers)

    end
  
  #delete trainline
    def self.destroy_transit_line(id)
    	headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        transit_line = {
          "id" => id
        }.to_json
      delete("/v1/stations/transits/#{id}",:body => transit_line,:headers => headers)

    end

    #find by selected ids then perfrom batch delete
    def self.destroy_all_transit_line(trainline_ids)
      headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        transit_line = {
          "id" => transitline_ids
        }.to_json
      delete("/v1/stations/transits/delete_batch_or_selected/",:body => transit_line,:headers => headers)
      
    end


    def self.inline_update(value,id)
      headers =  {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
      transit_line = {
          "line_name" => line_name
      }.to_json
      patch("/v1/stations/transits/#{id}",:body => transit_line,:headers => headers)
    end
    

end

