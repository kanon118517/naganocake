class Public::OrdersController < ApplicationController
  

  def new
    @order = Order.new
    @customer = current_customer
    @order.delivery_charge = 800
  end

  def confirm
    @order = Order.new(order_params)
    @order.delivery_postal_code = current_customer.postal_code
    @order.delivery_adress = current_customer.address
    @order.delivery_name = current_customer.last_name + current_customer.first_name
    @cart_items = CartItem.all
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def complete


  end

  def create
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if @order.save
      @cart_items.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item_id
        @order_item.order_id = @order.id
        @order_item.price = cart.item.with_tax_price
        @order_item.amount = cart.amount
        @order_item.save!
      end
      redirect_to complete_orders_path
      @cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end

  end

  def index

    @orders = current_customer.orders.all

    #@order_item = @orders.order_items
    #@sum = @order_item.inject(0) { |sum, item| sum + item.subtotal }
  end

  def show
    @order = Order.find(params[:id])
    @order_item = @order.order_items.all
    @sum = @order_item.inject(0) { |sum, item| sum + item.subtotal }
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment_method, :delivery_charge, :delivery_postal_code, :delivery_adress, :delivery_name, :payment)
  end



end
