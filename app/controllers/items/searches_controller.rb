class Items::SearchesController < ApplicationController
  before_action :set_search
  def index
    @items = @search.result(distinct: true)
    @keyword = (search_params[:name_cont])
  end

  private
  def set_search
    # 検索オブジェクト
    @search = Item.ransack(params[:q])
  end

  def search_params
    params.require(:q).permit(:name)
  end
end
