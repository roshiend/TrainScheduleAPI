class StationsController < ApplicationController
  require 'will_paginate/array'
  require 'station'
  def index
    all_stations = TrainStation.new()
    #displying all stations 
    @stations = all_stations.stations.paginate(page: params[:page],per_page: 10)
    
  end

  def new
    @station = TrainStation.new

  end

  def create
    station = TrainStation.new()

    response = station.createStation(params[:station_name],params[:station_code])
    
    #redirect to stations_path(index) if operation perfromed and params saved to api
    if response.success?
      redirect_to stations_path
    else
      render  :new
      puts "----------redirection upon failure----------------"

    end
  end

  #CSV upload Path
  def import
   station = TrainStation.new()
   if station.import(params[:file]) == :failed 
    render  :new
     puts "----------CSV operation not success----------------"
   else
    redirect_to stations_path
     
   end
  end


   
  

  def show

  end

  def edit
  end

  def update
  end

  def destroy
  end
  
end
