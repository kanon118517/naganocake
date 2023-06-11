class HomesController < ApplicationController
  def top
    @items = Item.page(params[:page])
    @items = Item.page(params[:page]).order(created_at: :desc).per(4)
  end

  def about
  end
end
