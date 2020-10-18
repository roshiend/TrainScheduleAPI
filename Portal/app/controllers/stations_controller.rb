class StationsController < ApplicationController
  
  require 'station'
  def index
    all_stations = TrainStation.new()
    #displying all stations 
    @stations = all_stations.stations
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
