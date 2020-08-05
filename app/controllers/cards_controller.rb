class CardsController < ApplicationController
  require "payjp"
  before_action :set_card, only: [:show, :destroy]
  def index

  end

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to card_path(current_user.id) if card.present?
  end

  def create
    Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)

    if params['payjp-token'].blank?
      redirect_to action: :new, alert: "あいうあ言うあいうあ"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token'],
      )
      @card = Card.new(user: current_user, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path(current_user.id)
      else
        redirect_to action: :new, alert: "クレジットカードを登録できませんでした。"
      end
    end
  end

  def show
    if @card.blank?
      redirect_to action: "new"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def destroy
    if @card.blank?
      redirect_to action: "show"
    else
      Payjp.api_key = Rails.application.credentials.dig(:payjp, :PAYJP_SECRET_KEY)
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.delete
    end
      redirect_to action: "new"
  end
  private
  def set_card
    @card = Card.where(user_id: current_user.id).first
  end
end
