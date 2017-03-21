class OrdersController < ApplicationController
  def create
    @order = Order.new
    @order.user_id = current_user.id
    @order.date = DateTime.now
    
    # Get menu_item id's from checkboxes
    # And add items to order
    no_empty_params = order_params[:menu_item_ids].reject { |c| c.empty? }
    no_empty_params.each do |item|
      @order.menu_items << MenuItem.find(item)
    end
    @order.save
    
    redirect_to orders_path and return if @order.errors.empty?
    redirect_to menu_path(Menu.current_menu),
                alert: 'Order has not created. Please, check 1 item per category'
  end
  
  def index
    @orders = Order.where(user_id: current_user.id)
  end
  
  def stats
    @orders = Order.all
    respond_to do |format|
      format.html # stats.html.erb
      format.json { render json: @orders.to_json(include: [:menu_items, :user], only: [:id, :date]) }
    end
  end
  
  def order_params
    params.require(:order).permit(menu_item_ids: [])
  end
end
