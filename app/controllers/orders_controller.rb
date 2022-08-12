class OrdersController < ApplicationController

  def index
    orders = Order.all.order(:id)
    if orders.length > 0
      render json: orders.as_json
    else
      render json: { error: "You have no orders!" }
    end
  end

  def show
    order = Order.find_by(id: params["id"])
    if order.user == current_user
      render json: order.as_json
    else
      render json: { error: "You can only view your own orders" }, status: :unauthorized
    end
  end

  def create
    product = Product.find_by(id: params["product_id"])

    subtotal = product.price
    tax = subtotal * 0.09
    total = subtotal + tax

    order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if order.user == current_user
      render json: order.as_json
    else
      render json: { error: "You must be logged in to place an order" }, status: :unauthorized
  end

end
