class LikesController < ApplicationController
  before_action :set_item, only: [:create, :destroy]
  def create
    @item = Item.find(params[:item_id])
    @like = current_user.likes.create(item_id: params[:item_id])
   
    # redirect_back(fallback_location: root_path)
  end

  def destroy
    @item = Item.find(params[:item_id])
    @like = Like.find_by(item_id: params[:item_id], user_id: current_user.id)
    @like.destroy
    # redirect_back(fallback_location: root_path)
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end
