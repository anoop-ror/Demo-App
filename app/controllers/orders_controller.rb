class OrdersController < ApplicationController
  def index
    @order = current_user.orders.first
  end

  def create
    @product = Product.find(params[:product_id])

    @order = current_user.orders.where(is_delivered: false).last
    if @order.nil?
      @order = current_user.orders.create
    end
    @order_items = @order.order_items.create(product_id: @product.id)
    redirect_to user_order_path(current_user,@order)
  end

  def show
    @order = current_user.orders.first
  end
end
