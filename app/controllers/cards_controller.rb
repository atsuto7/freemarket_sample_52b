class CardsController < ApplicationController
  require "payjp"
  before_action :set_card

  def index 
    if @card.present?
      Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = 'common/visa_icon.svg'
      when "JCB"
        @card_src = 'common/jcb_icon.svg'
      when "MasterCard"
        @card_src = 'common/master_icon.svg'
      when "American Express"
        @card_src = 'common/amex_icon.svg'
      when "Diners Club"
        @card_src = 'common/dinersclub_icon.svg'
      when "Discover"
        @card_src = 'common/discover_icon.svg'
      end
    end
  end

  def new 
    card = Card.where(user_id: current_user.id).first
    redirect_to action: "index" if card.present?
  end

  def create 
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']

    if params['payjp-token'].blank?
      redirect_to controller: 'cards', action: "new"
    else
      customer = Payjp::Customer.create(
        email: current_user.email,
        card: params['payjp-token']
        )
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save!
        redirect_to controller: 'products', action: "index"
      else
        redirect_to controller: 'cards', action: "new"
      end
    end
  end

  def destroy 
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy 
      redirect_to action: "index", notice: "削除しました"
    else 
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  private

  def set_card
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
  end
end
