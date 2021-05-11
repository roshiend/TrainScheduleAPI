class TransitsController < ApplicationController
  def new
    @changes_to = Transit.new_transit_line
  end

  def create
    @changes_to = Transit.create_transit_line(params[:station_id],params[:changes_to])
    if @trainline.success?
      redirect_to stations_path
      flash[:notice] = "#{@changes_to['line_name']} was created"
    else
      render  :new
      flash[:alert] = "Cannot perform action"
      puts @changes_to

    end
  end

  def update
  end

  def edit
  end

  def destroy
  end
end
