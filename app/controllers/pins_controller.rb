class PinsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show] #Needs to be at the top
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_filter :correct_user, only: [:edit, :update, :destroy]
 
  
  respond_to :html

  def index  #The page that lists all the pins
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new  #First part of create
    @pin = current_user.pins.build  #this builds pins through the user model and not pins
    respond_with(@pin)
  end

  def edit 
  end

  def create  #Second part of create
    @pin = current_user.pins.build(pin_params)  #this builds pins through the user model and not pins
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end
  
    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "You are not authorized for this action!" if @pin.nil?
    end

    def pin_params
      params.require(:pin).permit(:description)
    end
end
