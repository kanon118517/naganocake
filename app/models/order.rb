class Order < ApplicationRecord

  enum payment_method: { transfer: 1, credit_card: 2 }


    

end
