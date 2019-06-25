class PurchasesController < ApplicationController
  def show
    @product = Product.find(params[:id])
    @user = @product.user
  end
end
