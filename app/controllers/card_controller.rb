class CardController < ApplicationController
  require "payjp"

  def new
     # cardがすでに登録済みの場合、indexのページに戻します。
     @card = Card.where(user_id: current_user.id).first
     redirect_to action: "show" if @card.present?   
  end

  def create
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjpToken'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email, #なくてもOK
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show", notice:"支払い情報の登録が完了しました"
      else
        redirect_to action: "new"
      end
  end

  def delete
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  def buy
    @item = Item.find(params[:item_id])
    # すでに購入されていないか？
    if @item.buyer.present? 
      redirect_back(fallback_location: root_path) 
    elsif @card.blank?
      # カード情報がなければ、買えないから戻す
      redirect_to action: "new"
      flash[:alert] = '購入にはクレジットカード登録が必要です'
    else
      # 購入者もいないし、クレジットカードもあるし、決済処理に移行
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      # 請求を発行
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy',
      )
      # 売り切れなので、productの情報をアップデートして売り切れにします。
      if @item.update(buyer_id: current_user.id)
        flash[:notice] = '購入しました。'
        redirect_to controller: 'products', action: 'show', id: @item.id
      else
        flash[:alert] = '購入に失敗しました。'
        redirect_to controller: 'products', action: 'show', id: @item.id
      end
    end
  end
end
