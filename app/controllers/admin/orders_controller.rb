class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.all
    @sum = @order_item.inject(0) { |sum, item| sum + item.subtotal }
  end
end
