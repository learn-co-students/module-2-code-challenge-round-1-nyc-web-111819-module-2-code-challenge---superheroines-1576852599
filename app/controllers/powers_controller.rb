class PowersController < ApplicationController

  before_action :find_power, only: [:show]

  def show
  end

  private

  def find_power
    @power = Power.find(params[:id])
  end

end
