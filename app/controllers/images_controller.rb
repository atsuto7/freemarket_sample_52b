class ImagesController < ApplicationController
  def create
    @image = Image.new(image_params)
    @image.save
    respond_to do |format|
      format.html
      format.json
    end
  end
  private
  def image_params
    params.require(:image).permit(:image)
  end
end
