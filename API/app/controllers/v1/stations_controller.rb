class V1::StationsController < ApplicationController
  before_action :get_station, only:[:show,:update,:destroy]
  def index
    @stations = Station.all
    render json: @stations
  end

  def create
    @station = Station.new(station_params)
    if @station.save
      render json: @stations, status: :created, location: v1_stations_path
    else
      render json: @station.errors, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  private
    def get_station
    end

    def station_params
       params.permit(:station_name, :station_code)
      #params.require(:station).permit(:station_name, :station_code,:authenticity_token, :commit)
    end
end
