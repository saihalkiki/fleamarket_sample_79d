class ItemsController < ApplicationController
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
    @item=Item.find(params[:id])
  end
  
  def edit
    @item=Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :quality, :delivery_cost, :region, :period, :price, :user)
  end
end
