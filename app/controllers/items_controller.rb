class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items_new = Item.all.order("created_at DESC")
    @items_archive = Item.all
  end

  def new
    @item = Item.new
    
    #セレクトボックスの初期値設定
    @category_parent_array = ["選択してください"]
    #親階層のカテゴリー取得
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    # 子階層のカテゴリー取得
    def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
        # binding.pry
    end

    # 孫階層のカテゴリー取得
    def get_category_grandchildren
        #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
        @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
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
