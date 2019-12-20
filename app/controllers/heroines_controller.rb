class HeroinesController < ApplicationController
  def index
    if params['q']
      if Power.find_by(name: params['q']) == nil
        @heroines = Heroine.all
      else
        power = Power.find_by(name: params['q']).id
        @heroines = Heroine.all.select{|heroine| heroine.power_id == power.to_s}
      end
    else
      @heroines = Heroine.all
    end
  end
  def new
    @heroine = Heroine.new
  end
  def show
    @heroine = Heroine.find(params['id'])
  end
  def create
    @heroine = Heroine.new(heroine_params)
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      flash[:messages] = @heroine.errors.full_messages
      redirect_to '/heroines/new'
    end
  end

  private

  def heroine_params
    params.require('heroine').permit(['name','super_name','power_id'])
  end
end
