class MenuItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_item, only: [:update, :destroy]

  # GET /menu_items
  def index
    @items = MenuItem.all
  end


  # GET /menu_items/new
  def new
    @item = MenuItem.new
  end

  # POST /menu_items
  def create
  end

  # PUT /menu_items/:id
  def update
    @item.update(menu_item_params)
    puts menu_item_params
    if @item.errors.empty?
      redirect_to menu_item_path(@item)
    else
      render 'edit'
    end
  end

  # DELETE /menu_items/:id
  def destroy
    if current_user.admin
      @item.destroy
      redirect_to menus_path and return
    end
    render_404
  end

  private
  def find_item
    unless @item = MenuItem.where(id: params[:id]).first
      render_404
    end
  end

  # Strong parameters
  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :weight, :photo, :category_id, :menus)
  end
end
