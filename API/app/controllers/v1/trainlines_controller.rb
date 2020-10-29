class V1::TrainlinesController < ApplicationController
	before_action :find_trainline,only:[:show,:edit,:update,:destroy]
	def index 
	@trainlines = Trainline.all
	if !Trainline.nil?
    	render json: @trainlines,:include =>:stations
    else
    	render json: :no_content
	end
	end

	def create
	 @trainline = Trainline.new(trainline_params)
    if @trainline.save
    	render json: @trainline, status: :created, location: v1_trainlines_path(@trainline)
      else
      render json: @trainline.errors, status: :unprocessable_entity
    end
	end

	def show
		 render json: @trainline,:include =>:stations
	end

	def edit
		 render json: @trainline,:include =>:stations
	end

	def update
		 @trainline.update(trainline_params)
		#render json: @trainline,:include =>:stations
	end

	def destroy
		@trainline.destroy
	end

	def delete_batch_or_selected
	    Trainline.where(params[:trainline_ids]).destroy_all
	    
	    

	end


	private

	def find_trainline
		@trainline = Trainline.find(params[:id])
	end

	def trainline_params
		params.require(:trainline).permit(:line_name)
	end


end
