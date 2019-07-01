class PurchasesController < ApplicationController
  before_action :set_product, except: [:new]
  require 'payjp'

  def update
    @product.update!(purchase_status: 2, status: @product.status_before_type_cast, obligation_fee: @product.obligation_fee_before_type_cast, deliverytime: @product.deliverytime_before_type_cast, shipment_method: @product.shipment_method_before_type_cast )
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    amount: @product.price,
    customer: card.customer_id, 
    currency: 'jpy'
    )
    redirect_to root_path 
  end

  def edit
    @card = Card.where(user_id: current_user.id).first
    @user = @product.user
    if @card.blank?
      redirect_to controller: 'cards', action: 'index'
    elsif @product.purchase_status == 2
      redirect_to root_path  
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
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

  private
  def set_product
    @product = Product.find(params[:id])
  end
end
