class TrainlinesController < ApplicationController
  require 'will_paginate/array'
  before_action :find_trainline,only: [:show,:edit,:update,:destroy]
  
  def index
    @trainlines = Trainline.all_trainlines.paginate(page: params[:page],per_page: 10)
    # if !@trainlines.nil?
    #   @trainlines = Trainline.all_trainlines
    # end

  end

  def new
    @trainline = Trainline.new_trainline
  end
  
  def create
    @trainline = Trainline.create_trainline(params[:line_name])
    if @trainline.success?
      redirect_to trainlines_path
      flash[:notice] = "#{@trainline['line_name']} was created"
    else
      render  :new
      flash[:alert] = "Cannot perform action"
      puts @trainline

    end

  end

  def import
    if Trainline.import(params[:file]).nil? 
      redirect_to new_trainline_path
      puts "CSV operation not success---------------->>"
      flash[:alert] = "Csv import failed"
    else
      redirect_to trainlines_path
      flash[:notice] = "Trainlines are creatred"
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
       flash[:notice] = "#{@trainline['line_name']} updated"
    else
      render  :edit
       flash[:alert] = "update is not successful"
      puts @trainline
    end

  end

  def inline_update
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
     flash[:notice] = "#{@trainline['line_name']} Removed !"
    else
      redirect_to trainlines_path(@trainline)
      puts @trainline.response
      flash[:alert] = "Trainline is not Removed,Try again?"
    end
  end


  def delete_batch_or_selected
    
   @trainline= Trainline.destroy_all_trainline(params[:trainline_ids])
    if @trainline.success?
      redirect_to trainlines_path
      flash[:notice] = "Selected Trainlines are removed !"
    else
      render :index
      puts @trainline.response
      flash[:alert] = "Selected Trainlines are not Removed,Try again?"
    end
    
  end




  private 
   def find_trainline
     @trainline = Trainline.find_trainline(params[:id])
   end
end
