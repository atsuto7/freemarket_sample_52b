class CategoriesController < ApplicationController
  def search
    @categories = Category.where(parent_id: params[:category_id]) 
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def show
   @category = Category.find(params[:id])
   if @category.id <= 9
    secound_id = Category.where(parent_id: params[:id])
    thirds = Category.where(parent_id: secound_id)
    third_id = []
    thirds.each do |category|
      third_id << category.id
    end
    @products = Product.where(category_id: third_id)
   elsif @category.id <= 158
    thirds = Category.where(parent_id: params[:id])
    third_id = []
    thirds.each do |category|
      third_id << category.id
    end
    @products = Product.where(category_id: third_id)
  else 
    @products = Product.where(category_id: params[:id])
   end
  end
end

