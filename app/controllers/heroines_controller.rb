class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :edit, :update]

  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    heroine = Heroine.create(heroine_params)
    if heroine.valid?
      redirect_to heroine_path(heroine)
    else
      flash[:messages] = heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end
