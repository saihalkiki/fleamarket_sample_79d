class PurchaseController < ApplicationController
  before_action :set_item_id, only: [:index, :pay, :done]
  require 'payjp'


  def index
    card = Card.where(user_id: current_user.id).first
    if card.blank?
      store_location
      flash.now[:notice] = "クレジットカードを登録してください"
      redirect_to controller: "cards", action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end

  def pay
    @card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
    )
    redirect_to action: 'done'
  end

  def done
    @item_purchaser = Item.find(params[:item_id])
    @item_purchaser.update(purchaser_id: current_user.id)
    redirect_to item_path(@item)
  end

  private
  def set_item_id
    @item = Item.find(params[:item_id])
  end

end