class Order < ApplicationRecord

  enum payment_method: { transfer: 1, credit_card: 2 }

    belongs_to :customer
    has_many :order_items



end
