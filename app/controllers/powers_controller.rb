class PowersController < ApplicationController
  # before_action :find_power, only: [:show]
  
  
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

  
end
