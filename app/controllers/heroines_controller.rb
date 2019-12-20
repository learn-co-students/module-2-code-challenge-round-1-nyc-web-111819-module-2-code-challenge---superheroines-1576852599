class HeroinesController < ApplicationController

  before_action :find_heroine, only: [:show, :edit, :update, :destroy]
  
  def index
    @heroines = Heroine.all
  end

  def show
    #@heroine = Heroine.find(params[:id])
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

  def edit
    #@heroine = Heroine.find(params[:id])
  end

  def update
    #@heroine = Heroine.find(params[:id])
    if @heroine.update(heroine_params)
    redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to edit_heroine_path
    end
  end

  def destroy
    #@heroine = Heroine.find(params[:id])
    @heroine.delete
    redirect_to heroines_path
  end


  private

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end


end
