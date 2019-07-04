class ProductsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.order("created_at DESC").limit(8)
  end

  def search
    if params[:q].present?
      initilize_ransack_variable
      @q = Product.ransack(params[:q])
      @items = @q.result(distinct: true)
      @categories = Category.all
      # binding.pry
    else
      initilize_ransack_variable
      @products = Product.where("name Like(?)","%#{params[:keyword]}%")
      @q = Product.ransack
      @categories = Category.all
    end
  end

  def initilize_ransack_variable
    @price_list = Product.price_select_list
    @status_list = Product.status_check_list
    @obligation_fee_list = Product.obligation_fee_check_list
    @purchase_status_list = Product.purchase_status_check_list
  end

  def query_params
    params.require(:q).permit(
      :name_cont,
    ) if params[:q].present?
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
    if Product.find(params[:id]).user_id == current_user.id
      @image = Image.new
      @product = Product.find(params[:id])
    end
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
    if current_user.id == Product.find(params[:id]).user_id
      Product.transaction do
        @images = Image.where(product_id: params[:id])
          @images.each do |image|
            image.destroy
          end
        @product = Product.find(params[:id])
        @product.destroy
    end
  end
    redirect_to root_path
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status, :obligation_fee, :shipment_method, :deliverytime, :price, :prefecture_id, image_attributes:[:image])
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
