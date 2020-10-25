class StationsController < ApplicationController
  require 'station'
  require 'will_paginate/array'
  before_action :find_train_station,only: [:show,:edit,:update]
  
  def index
    #displying all stations 
    @stations = TrainStation.new.all.paginate(page: params[:page],per_page: 10)
  end

  def new
    @station  = TrainStation.new()
  end

  def create
    @station = TrainStation.new.create(params[:station_name],params[:station_code])
    #redirect to stations_path(index) if operation performed and params saved to api
    if @station.success?
      redirect_to stations_path
    else
      render  :new
      puts "redirection upon failure ---------------->>"
    end
  end

  #CSV upload Path
  def import
    if TrainStation.new.import(params[:file]) == :failed 
      render  :new
      puts "CSV operation not success---------------->>"
    else
      redirect_to stations_path
    end
  end

  def show
    unless  @station.success?
      render :new
      puts @station.response
    end
  end

  def edit
    unless @station.success?
     redirect_to new_station_path
     puts @station.response
    end
  end

  def update
    @station = TrainStation.new.update(params[:station_name],params[:station_code])
    if @station.success?
      redirect_to stations_path
    else
      render :new
      
    end
  end

  def destroy
    @station = TrainStation.new.destroy(params[:id])
    if@station.success?
     redirect_to stations_path
    else
      puts @station.response
    end
  end

  private 
   def find_train_station
     @station = TrainStation.new.find(params[:id])
   end
end
