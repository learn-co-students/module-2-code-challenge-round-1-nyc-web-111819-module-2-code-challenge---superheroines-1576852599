class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show]
  
  def index

    @heroines = Heroine.search(params[:search])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    heroine = Heroine.create(heroine_params)
    # if heroine.valid?
      redirect_to heroines_path
    # else
  
      # redirect_to new_heroine_path
    # end
  end

  def show

  end

  

  private

  def find_heroine
    @heroine = Heroine.find(params[:id, :search])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id, :search)
  end


end
