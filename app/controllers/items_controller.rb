class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items_new = Item.all.order("created_at DESC")
    @items_archive = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
    
    ##親階層のカテゴリー取得
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 子階層のカテゴリー取得
  def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
      # binding.pry
  end

  # 孫階層のカテゴリー取得
  def get_category_grandchildren
      #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
      @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    item = Item.new(item_params)
    # binding.pry
    if item.save
      flash.now[:notice] = "出品しました！"
      redirect_to item_path(item)
    else
      @category_parent_array = Category.where(ancestry: nil)
      render :new
    end
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
    params.require(:item).permit(:name, :explanation, :quality, :delivery_cost, :period, :price,  :prefecture_id, :category_id ).merge(user_id: current_user.id)
  end
  def set_item
    @item=Item.find(params[:id])
  end
end
