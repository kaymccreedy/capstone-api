class PhotosController < ApplicationController

  def index
		@photos = Photo.all.order(:id)
		render template: "photos/index"
  end

  def show
    @photo = Photo.find_by(id: params["id"])
    render template: "photos/show"
  end

end
