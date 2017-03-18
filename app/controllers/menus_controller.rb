class MenusController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_admin, only: [:edit, :update]
  before_filter :find_item, only: [:show, :edit, :update]

  # GET /menus
  def index
    @menu = Menu.all
  end

  # GET /menus/:id
  def show
    @order = current_order
  end

  # GET /menus/:id/edit
  def edit
    # if @menu.publish_date < 1.day.ago
    #   redirect_to menu_path, alert: 'Not today menus'
    # else
      @menu_item = MenuItem.new
    # end
  end

  # GET /menus/new
  def new
  end

  # POST /menus
  def create
  end

  # PUT /menus/:id
  # This part is ugly. I think it could be rewritten in different way.
  # But I don't know how.
  def update
    @menu_item = MenuItem.create(menu_params)
    @menu_item.menu << @menu
    @menu_item.save
    redirect_to menu_path(@menu)
  end

  private
  def find_item
    unless @menu = Menu.where(id: params[:id]).first
      render_404
    end
  end

  # Strong parameters
  def menu_params
    params.require(:menu_item).permit(:name, :price, :weight, :category_id)
  end
end
