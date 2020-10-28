class V1::StationsController < ApplicationController
  before_action :get_station, only:[:show,:edit,:update,:destroy]
  def index
    @stations = Station.all
    render json: @stations
  end

  def create
    @station = Station.new(station_params)
      
        if @station.save
          
           render json: @station, status: :created, location: v1_stations_path(@station)
        else
          
           render json: @station.errors, status: :unprocessable_entity
           
       end
      

    

  end

  def show
     render json: @station
  end
  def edit
    render json: @station

  end


  def update
    @station.update(station_params)
    #render json: @station
  end

  def destroy
    @station.destroy


    #render json: { status: 'SUCCESS', message: 'deleted the post', data: @station }
  end
  
  private
    def get_station
      @station = Station.find(params[:id])
      #render json: @station
    end

    def station_params
     params.require(:station).permit(:station_name, :station_code,:trainline_id)
    end
end
