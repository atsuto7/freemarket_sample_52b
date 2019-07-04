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
   @all_category = []
   if @category.id <= 13
    secound_id = Category.where(parent_id: params[:id])
    thirds = Category.where(parent_id: secound_id)
    third_id = []
    thirds.each do |category|
      third_id << category.id
    end
    @products = Product.where(category_id: third_id)
    @all_category << @category
   elsif @category.id <= 158
    thirds = Category.where(parent_id: params[:id])
    third_id = []
    thirds.each do |category|
      third_id << category.id
    end
    @products = Product.where(category_id: third_id)
    @all_category << Category.find(@category.parent_id)
    @all_category << @category
  else 
    @products = Product.where(category_id: params[:id])
    secoundctg = Category.find(@category.parent_id)
    firstctg = Category.find(secoundctg.parent_id)
    @all_category << firstctg
    @all_category << secoundctg
    @all_category << @category
   end
  end
end

