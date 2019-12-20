class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def new 
    @heroine = Heroine.new
  end

  def create 
    @heroine = Heroine.create(strong)
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def edit
  end

  def update
  end

  def delete
  end

  private 

  def strong
      params.require(params).permit(:name, :super_name)
   end
end
