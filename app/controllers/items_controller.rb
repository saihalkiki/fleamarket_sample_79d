class ItemsController < ApplicationController
  def index
    @items_new = Item.all.order("created_at DESC")
    @items_archive = Item.all
  end
  def show
    @item=Item.find(params[:id])
  end
end
