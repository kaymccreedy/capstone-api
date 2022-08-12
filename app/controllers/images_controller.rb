class ImagesController < ApplicationController

  def index
    images = Image.all.order(:id)
    render json: images.as_json
  end
  
end
