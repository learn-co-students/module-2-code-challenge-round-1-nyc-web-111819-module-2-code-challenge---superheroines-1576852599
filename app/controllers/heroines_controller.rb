class HeroinesController < ApplicationController
  def index
    @search = Heroine.new(params[:heroine])
    @heroines = Heroine.all
  end
  def show
    @heroine = Heroine.find(params[:id])
  end 
  def new
    @heroine = Heroine.new
  end 

  def create 
    @heroine = Heroine.create(strong_params)

    if @heroine.valid?
      @heroine.save
    redirect_to heroine_path(@heroine)
    else 
    flash[:messages] = @heroine.errors.full_messages
    redirect_to new_heroine_path
    end
  end 

private 

def strong_params
  params.require(:heroine).permit(:name, :super_name, :power_id)
end 
end
