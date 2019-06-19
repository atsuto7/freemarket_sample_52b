class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.save
    respond_to do |format|
      format.html
      format.json
    end
  end
  def update
    @image = Image.find(params[:id])
    @image.update(image_params)
  end
  def destroy
    image = Image.find(params[:id])
    image.destroy
  end
  private
  def image_params
    params.require(:image).permit(:image, :product_id)
  end
end
