class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]
  def index
    @items_new = Item.all.order("created_at DESC")
    @items_archive = Item.all
    @category_parent_array = Category.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @image = @item.images.build
    #親階層のカテゴリー取得
    @category_parent_array = Category.where(ancestry: nil)
  end

  # 子階層のカテゴリー取得
  def get_category_children
      #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
      @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children
  end

  # 孫階層のカテゴリー取得
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash.now[:notice] = "出品しました！"
      redirect_to item_path(@item.id)
    else
      @category_parent_array = Category.where(ancestry: nil)
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @like = Like.new
  end

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
  end

  def edit
    @category_grandchildren = @item.category
    @category_grandchildren_array = @category_grandchildren.siblings
    @category_children = @category_grandchildren.parent
    @category_children_array = @category_children.siblings
    @category_parent = @category_grandchildren.root
    @category_parent_array = @category_parent.siblings
  end

  def update
      @category_grandchildren = @item.category
      @category_grandchildren_array = @category_grandchildren.siblings
      @category_children = @category_grandchildren.parent
      @category_children_array = @category_children.siblings
      @category_parent = @category_grandchildren.root
      @category_parent_array = @category_parent.siblings
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to user_path
    else
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :explanation, :quality, :delivery_cost, :period_id, :price,  :prefecture_id, :category_id,images_attributes: [:image, :item_id, :_destroy, :id] ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
