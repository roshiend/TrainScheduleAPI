class StationsController < ApplicationController
  require 'station'
  require 'will_paginate/array'
  before_action :find_train_station,only: [:show,:edit,:destroy]
  
  def index
    #displying all stations 
    @stations = TrainStation.new.all.paginate(page: params[:page],per_page: 10)
  end

  def new
    @station  = TrainStation.new()
  end

  def create
    @station = TrainStation.new.create(params[:station_name],params[:station_code])
    #redirect to stations_path(index) if operation perfromed and params saved to api
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
      puts "redirection upon failure---------------->>"
    end
  end

  def edit
    unless @station.success?
     redirect_to new_station_path
     puts "Cant find page or render !---------------->>"
    end
  end

  def update
    @station = TrainStation.new.update(params[:station_name],params[:station_code])
    if @station.success?
      redirect_to stations_path
    else
      render :new
      puts "redirection upon failure---------------->"
    end
  end

  def destroy
  end

  private 

   def find_train_station
     @station = TrainStation.new.find(params[:id])
   end


   
  
end
