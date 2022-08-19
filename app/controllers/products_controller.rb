class ProductsController < ApplicationController

  def index
    @products = Product.all.order(:id)
    render template: "products/index"
  end

  def show
    @product = Product.find_by(id: params["id"])
    render template: "products/show"
  end

end
