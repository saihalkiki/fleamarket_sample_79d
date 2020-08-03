class CardsController < ApplicationController
  require "payjp"
  def index
  end
  
  def new
    card = Card.where(user_id: current_user.id)
    # redirect_to card_path(current_user.id) if card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params['payjp_token'].blank?
      binding.pry
      redirect_to action: :new, alert: "あいうあ言うあいうあ"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
      )
      @card = Card.new(user: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: :index
      else
        redirect_to action: :new, alert: "クレジットカードを登録できませんでした。"
      end
    end
  end
end
