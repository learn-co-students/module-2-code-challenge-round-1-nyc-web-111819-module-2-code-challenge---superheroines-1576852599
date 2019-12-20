class PowersController < ApplicationController
  def index
    @powers = Power.all_sorted_abc_titlecase
  end

  def show
    @power = Power.find(params[:id])
  end
end
