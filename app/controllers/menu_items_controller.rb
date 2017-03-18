class MenuItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_item, only: [:show, :edit, :update, :destroy]

  # GET /menu_items
  def index
    @items = MenuItem.all
  end

  # GET /menu_items/:id
  def show
  end

  # GET /menu_items/new
  def new
    @item = MenuItem.new
  end

  # GET /menu_items/:id/edit
  def edit
  end

  # POST /menu_items
  def create
    puts menu_item_params
    # creates new item based on users input(params in form)
    # puts params[:item]
    # @item = MenuItem.create(menu_item_params)
    # if @item.errors.empty?
    #   redirect_to menu_item_path(@item)
    # else
    #   render 'new'
    # end
  end

  # PUT /menu_items/:id
  def update
    @item.update(menu_item_params)
    if @item.errors.empty?
      redirect_to menu_item_path(@item)
    else
      render 'edit'
    end
  end

  # DELETE /menu_items/:id
  def destroy
    @item.destroy
    redirect_to action: 'index'
  end

  private
  def find_item
    unless @item = MenuItem.where(id: params[:id]).first
      render_404
    end
  end


  # Strong parameters
  def menu_item_params
    params.require(:menu_item).permit(:name, :price, :weight, :category_id, :menus)
  end
end
