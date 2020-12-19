class StationsController < ApplicationController
  require 'will_paginate/array'
  #require 'trainline'
  before_action :find_train_station,only: [:show,:edit,:update,:destroy]
  
  def index
    @stations = Station.all_stations.paginate(page: params[:page],per_page: 10)
    
  end

  def new
    @station = Station.new_station
  end
  
  def create
    @station = Station.create_station(params[:station_name],params[:station_code],params[:trainline_id])
    if @station.success?
      redirect_to stations_path
      flash[:notice] = "Action Completed !"
    else
      render  :new
      flash[:alert] = "Cannot perform action"
      puts @station

    end

  end

  def import
    
    @import = Station.import(params[:file],params[:trainline_id])
    if @import.nil?
      redirect_to new_station_path
      puts "Train line must select before import...."
      flash[:alert] = "Make sure Train line is selected before import"
    else
      redirect_to stations_path
      flash[:notice] = "Action Completed !"
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
      flash[:notice] = "Update Completed !"
    else
      render  :edit
      flash[:alert] = "Update not successful !"
      puts @station
    end

  end

  def destroy
    @station = Station.destroy_station(params[:id])
     
    if@station.success?
     redirect_to stations_path
     flash[:notice] = "Station Removed !"
    else
      redirect_to stations_path(@station)
      puts @station.response
      flash[:alert] = "Station not Removed,Try again?"
    end
  end

  def delete_batch_or_selected
    
   @station= Station.destroy_all_stations(params[:station_ids])
    if @station.success?
      redirect_to stations_path
      flash[:notice] = "Selected Stations are removed !"
    else
      render :index
      puts @station.response
      flash[:alert] = "Selected Stations are not Removed,Try again?"
    end
    
  end




  private 
   def find_train_station
     @station = Station.find_station(params[:id])
   end
end
