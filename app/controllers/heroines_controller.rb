class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end
  def show 
    @heroine = Heroine.find(params[:id])
  end 
  def create 
    @heroine = Heroine.create(heroine_params)
    if heroine_params == heroine_params
      redirect_to show_heroine_path
    else 
      flash[:messages] = heroine.error.full_messages
      redirect_to 
    end 
  end 

private
  def heroine_params
    params.require(:heroine).permit(:name, :super_name)

  end
end
