class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy]
  
  def index
    @powers = Power.all
  end

  def show
    #@power = Power.find(params[:id])
  end

  def new
    @power = Power.new
  end

    def create
        power = Power.create(power_params)
    if power.valid?
    redirect_to power_path(power)
    else
      flash[:messages] = power.errors.full_messages
      redirect_to new_power_path
    end    
  end

  def edit
    #@power = Power.find(params[:id])
  end

  def update
    #@power = Power.find(params[:id])
    if @power.update(power_params)
    redirect_to power_path(@power)
    else
      flash[:messages] = @power.errors.full_messages
      redirect_to edit_power_path
    end
  end

  def destroy
    #@power = power.find(params[:id])
    @power.delete
    redirect_to powers_path
  end


  private

  def find_power
    @power = Power.find(params[:id])
  end

  def power_params
    params.require(:power).permit(:name, :description)
  end

end
