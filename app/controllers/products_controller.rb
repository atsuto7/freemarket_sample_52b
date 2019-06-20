class ProductsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.order("created_at DESC").limit(8)
  end
  
  def show
    @products = Product.order("created_at DESC").limit(6)
    @product = Product.find(params[:id])
    @user = @product.user.products.order("created_at DESC").limit(6)
  end
  def new
    @product = Product.new
    @image = Image.new
  end
  def create
    @product = Product.new(params_int(product_params))  
    @product.purchase_status = 1
    @product.user_id = current_user.id
    if @product.save
       @product.id 
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :new
    end
  end
  def edit
    @image = Image.new
    @product = Product.find(params[:id])
  end
  def update
    @product = Product.find(params[:id])
    if @product.update(params_int(product_params))
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :edit
    end
  end
  def destroy
  end
  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :description, :status, :obligation_fee, :shipment_method, :deliverytime, :price, :prefecture_id, image_attributes:[:image])
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
