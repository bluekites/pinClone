class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index  #The page that lists all the pins
    @pins = Pin.all
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new  #First part of create
    @pin = Pin.new
    respond_with(@pin)
  end

  def edit 
  end

  def create  #Second part of create
    @pin = Pin.new(pin_params)
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

    def pin_params
      params.require(:pin).permit(:description)
    end
end
