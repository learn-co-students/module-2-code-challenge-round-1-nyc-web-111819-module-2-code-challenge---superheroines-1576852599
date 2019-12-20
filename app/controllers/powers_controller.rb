class PowersController < ApplicationController
  before_action :find_power, only: [:show, :edit, :update, :destroy]

  def index
    @powers = Power.all
  end

  def show
  end

  def new 
    @power = Power.new
  end

  def create
    @power = Power.create(power_params)

    if @power.valid?
      redirect_to power_path(@power)
    else
      flash[:messages] = @power.errors.full_messages
      redirect_to new_power_path
    end

  end

  def edit 
  end

  def update
    @power = Power.update(power_params)

    if @power.valid?
      redirect_to power_path(@power)
    else
      flash[:messages] = @power.errors.full_messages
      redirect_to edit_power_path(@power)
    end

  end

  def destroy
    @power.destroy
  end

  private

  def power_params
    params.require(:power).permit(:name, :description)
  end

  def find_power
    @power = Power.find(params[:id])
  end

end
