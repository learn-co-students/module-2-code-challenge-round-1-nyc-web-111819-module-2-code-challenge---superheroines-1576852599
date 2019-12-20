class HeroinesController < ApplicationController
  def index
    if !!params[:q]
        @heroines = Heroine.all_abc.select do |heroine|
          heroine.power.name.downcase == params[:q].downcase
        end
      flash[:refresh_option] = true
    else
      @heroines = Heroine.all_abc
    end
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all_sorted_abc_titlecase
  end

  def create
    heroine = Heroine.create(heroine_params)

    if heroine.valid?
      redirect_to(heroine_path(heroine))
    else
      flash[:messages] = heroine.errors.full_messages
      redirect_to(new_heroine_path)
    end
  end

  private

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end
