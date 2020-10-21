class StationsController < ApplicationController
  require 'station'
  require 'will_paginate/array'
  before_action :initialize_train_station,only: [:index,:new,:create,:edit,:show,:update,:delete,:import]
  
  
  def index
    station = TrainStation.new()
    #displying all stations 
    @stations = station.stations.paginate(page: params[:page],per_page: 10)
    
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
    station = TrainStation.new()
    @station = station.find_by_id_or_slug(params[:id])
    if @station.success?
      puts @response.inspect
       
    else
      render :new
      puts "----------redirection upon failure----------------"
    end

  end

  def edit
    station = TrainStation.new()
    @station = station.find_by_id_or_slug(params[:id])
   
    unless @station.success?
     redirect_to new_station_path
     puts "----------Cant find page or render !----------------"
    end
  end

  def update
    station = TrainStation.new()
    response = station.edit_or_update(prams[:station_name],params[:station_code])
    if response.success?
      redirect_to stations_path

    else
      render :new
      puts "----------redirection upon failure----------------"
    end
  end

  def destroy
  end

  private 

   def initialize_train_station
     station = TrainStation.new()
   end
  
end
