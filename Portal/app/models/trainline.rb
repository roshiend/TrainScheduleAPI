class Trainline<ApplicationRecord
  include HTTParty
  require 'csv'

  base_uri 'localhost:3001'
   
      
  #get all stations
    def self.all_trainlines 
      get("/v1/trainlines")
    end
    
  #init new station not important
    def self.new_trainline
    	get(base_uri)
    end

  #create trainline. Parent exisit must !
    def self.create_trainline(line_name)
      headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
      }

       trainline = {
          "line_name" => line_name,
          
      }.to_json
      post("/v1/trainlines",:body => trainline,:headers => headers)
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
        post("/v1/trainlines",:body => trainline,:headers => headers)
      end
    end
  
  #find_by id 
    def self.find_trainline(id)
    	 get("/v1/trainlines/#{id}")
    end
  
  #update trainline params, currently ID should pass into controller action to work.
    def self.update_trainline(line_name,id)
    	headers =  {
        "Content-Type": "application/json",
        "Accept": "application/json"
      }
      trainline = {
          "line_name" => line_name
      }.to_json
      patch("/v1/trainlines/#{id}",:body => trainline,:headers => headers)

    end
  
  #delete trainline
    def self.destroy_trainline(id)
    	headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        trainline = {
          "id" => id
        }.to_json
      delete("/v1/trainlines/#{id}",:body => trainline,:headers => headers)

    end


    def self.destroy_all_trainline(id)
      headers =  {
          "Content-Type": "application/json",
          "Accept": "application/json"
        }
        trainline = {
          "id" => id
        }.to_json
      delete("/v1/trainlines/#{id}",:body => trainline,:headers => headers)

    end

end

