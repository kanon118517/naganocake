class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  def subtotal
    item.with_tax_price * amount.to_i
  end

end
