class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    if @image.save
    respond_to do |format|
      format.html
      format.json
    end
  else
    render :new
  end
  end
  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
    else
      render :new
    end
  end
  private
  def image_params
    params.require(:image).permit(:image, :product_id)
  end
end
