class ProductsController < ApplicationController
  def index
  end
  def show
    @
  end
  def new
    @product = Product.new
  end
  def create
    @product = Product.new(params_int(product_params))  
    @product.prefecture = 1
    @product.shipment_method = 1
    @product.save
  end
  def update
  end
  def edit
  end
  def destroy
  end
  private

  def product_params
    params.require(:product).permit(:name, :description, :status, :obligation_fee, :shipment_method, :deliverytime, :price)
  end
  def params_int(model_params)
    model_params.each do |key,value|
      if integer_string?(value)
        model_params[key]=value.to_i
      end
    end
end
def integer_string?(str)
  Integer(str)
  true
rescue ArgumentError
  false
end
end
