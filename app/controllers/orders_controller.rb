class OrdersController < ApplicationController
  def show
    @order = Order.where(:id ,params[:id])
  end

  def create
    @order = Order.new
    @menu_items = order_params
    puts @menu_items
  end

  def index
     @orders = Order.find_by user_id: current_user.id
  end

  def stats

  end

  def order_params
    params.require(:menu_items).permit()
  end
end
