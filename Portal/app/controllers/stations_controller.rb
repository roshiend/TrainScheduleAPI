class StationsController < ApplicationController
  require 'will_paginate/array'
  #require 'trainline'
  before_action :find_train_station,only: [:show,:edit,:update,:destroy]
  
  def index
    @stations = Station.all_stations
  end

  def new
    @station = Station.new_station
  end
  
  def create
    @station = Station.create_station(params[:station_name],params[:station_code],params[:trainline_id])
    if @station.success?
      redirect_to stations_path
    else
      render  :new
      puts @station

    end

  end

  def import
    if Station.import(params[:file]) == :failed 
      render  :new
      puts "CSV operation not success---------------->>"
    else
      redirect_to stationss_path
    end
  end


  def show
   
  end

  def edit
    
  end

  def update
    @station = Station.update_station(params[:station_name],params[:station_code],params[:trainline_id],params[:id])
    if @station.success?
      redirect_to stations_path(@station)
    else
      render  :edit
      puts @station
    end

  end

  def destroy
    @station = Station.destroy_station(params[:id])
     
    if@station.success?
     redirect_to stations_path
    else
      redirect_to stations_path(@station)
      puts @station.response
    end
  end

  def delete_batch_or_selected
    
   @station= Station.destroy_all_stations(params[:station_ids])
    if @station.success?
      redirect_to stations_path
    else
      render :index
      puts @station.response
    end
    
  end




  private 
   def find_train_station
     @station = Station.find_station(params[:id])
   end
end
