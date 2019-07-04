class ProductsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    category_products = []
    @parent_categories = Category.limit(8)
    @parent_categories.each do |parent_category|
      children_categories = Category.where(parent_id: parent_category.id)
      children_category_id_box = []
      children_categories.each do |children_category|
        children_category_id = children_category.id
        children_category_id_box << children_category_id
      end
      grandchildren_categories  = Category.where(parent_id: children_category_id_box)
      grandchildren_category_id_box = []
      grandchildren_categories.each do |grandchildren_category|
        grandchildren_category_id = grandchildren_category.id
        grandchildren_category_id_box << grandchildren_category
      end
      products = Product.where(category_id: grandchildren_category_id_box)
      category_products << products
    end
    @category_products = category_products
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
      @keyword = "#{params[:keyword]}"
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
    @product = Product.find(params[:id])
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
