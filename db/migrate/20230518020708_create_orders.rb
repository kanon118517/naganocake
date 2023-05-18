class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.string :delivery_postal_code
      t.string :delivery_adress
      t.string :delivery_name
      t.integer :delivery_charge
      t.integer :payment
      t.integer :payment_method

      t.timestamps
    end
  end
end
