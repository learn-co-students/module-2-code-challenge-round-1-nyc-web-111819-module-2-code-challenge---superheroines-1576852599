class HeroinesController < ApplicationController
  before_action :find_heroine, only: [:show, :edit, :update, :destroy]

  def index
    @heroines = Heroine.all
    @search = params[:q]
  end

  def show
  end

  def new 
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.create(heroine_params)

    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to new_heroine_path
    end
  end

  def edit 
    @powers = Power.all
  end

  def update

    @heroine.update(heroine_params)
    
    if @heroine.valid?
      redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to edit_heroine_path(@heroine)
    end
  end

  def destroy
    @heroine.destroy
    redirect_to heroines_path
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end

  def find_heroine
    @heroine = Heroine.find(params[:id])
  end

end
