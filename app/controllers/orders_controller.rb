class OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user)
    if @orders.length > 0 && current_user
      render template: "orders/index"
    elsif current_user
      render json: { error: "You have no orders!" }
    else
      render json: { error: "You must be logged in to view orders" }, status: :unauthorized
    end
  end

  def show
    @order = Order.find_by(id: params["id"])
    if @order
      render template: "orders/show"
    else
      render json: { error: "No order found" }, status: :unauthorized
    end
  end

  def create
    product = Product.find_by(id: params["product_id"])

    subtotal = product.price
    tax = subtotal * 0.09
    total = subtotal + tax

    @order = Order.new(
      user_id: current_user.id,
      product_id: params["product_id"],
      quantity: params["quantity"],
      subtotal: subtotal,
      tax: tax,
      total: total
    )
    if current_user
      @order.save
      render template: "orders/show"
    else
      render json: { error: "You must be logged in to place an order" }, status: :unauthorized
    end
  end

end
