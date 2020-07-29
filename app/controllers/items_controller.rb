class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items_new = Item.all.order("created_at DESC")
    @items_archive = Item.all
  end

  def new
    @item=Item.new
  end

  def create
    Item.create(item_params)
  end

  def show
  end
  
  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      redirect_to edit_item_path(@item)
    end
  end

  def destroy
     @item.destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :quality, :delivery_cost, :period, :price, :user, :prefecture_id)
  end
  def set_item
    @item=Item.find(params[:id])
  end
end
