class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.where(user_id: current_user.id)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      flash[:notice] = 'Food was successfully created'
      redirect_to foods_path
    else
      flash[:alert] = 'Food was not created'
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    flash[:notice] = 'Food was successfully deleted'
    redirect_to foods_path
  end

  private
  
  def food_params
    params.require(:food).permit(:name, :price, :quantity, :units)
  end
end
