class PurchasesController < ApplicationController
  before_action :set_product

  def update
    # binding.pry
    @product.update(purchase_status: 2, status: @product.status_before_type_cast, obligation_fee: @product.obligation_fee_before_type_cast, deliverytime: @product.deliverytime_before_type_cast, shipment_method: @product.shipment_method_before_type_cast )
    redirect_to root_path
  end

  def edit
    @user = @product.user
  end

  def pay
  Payjp.api_key = 'sk_test_2416312f596051ace8ba7bab'
  charge = Payjp::Charge.create(
  :amount => 3500,
  :card => params['payjp-token'],
  :currency => 'jpy'
  )
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end



end
