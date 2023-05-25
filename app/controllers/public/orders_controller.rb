class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @customer = current_customer
  end

  def confirm
    @order = Order.new
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end
end
