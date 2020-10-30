class TrainlinesController < ApplicationController
  require 'will_paginate/array'
  before_action :find_trainline,only: [:show,:edit,:update,:destroy]
  
  def index
    @trainlines = Trainline.all_trainlines.paginate(page: params[:page],per_page: 10)

  end

  def new
    @trainline = Trainline.new_trainline
  end
  
  def create
    @trainline = Trainline.create_trainline(params[:line_name])
    if @trainline.success?
      redirect_to trainlines_path
    else
      render  :new
      puts @trainline

    end

  end

  def import
    if Trainline.import(params[:file]) == :failed 
      render  :new
      puts "CSV operation not success---------------->>"
    else
      redirect_to trainlines_path
    end
  end


  def show
   
  end

  def edit
    
  end

  def update
    @trainline = Trainline.update_trainline(params[:line_name],params[:id])
    if @trainline.success?
      redirect_to trainlines_path(@trainline)
    else
      render  :edit
      puts @trainline
    end

  end

  def destroy
    @trainline = Trainline.destroy_trainline(params[:id])
     
    if@trainline.success?
     redirect_to trainlines_path
    else
      redirect_to trainlines_path(@trainline)
      puts @trainline.response
    end
  end


  def delete_batch_or_selected
    
   @trainline= Trainline.destroy_all_trainline(params[:trainline_ids])
    if @trainline.success?
      redirect_to trainlines_path
    else
      render :index
      puts @trainline.response
    end
    
  end




  private 
   def find_trainline
     @trainline = Trainline.find_trainline(params[:id])
   end
end
