class StationsController < ApplicationController
  def index
    @stations = Station.new.stations
  end

  def new
    @station = Station.new
  end

  def create
    @station = Station.new(station_params)
    if@station.save
      redirect_to stations_path
    else
      render :new
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
  private
    def station_params
      params.require(:station).permit(:station_name,:station_code)
    end
end
