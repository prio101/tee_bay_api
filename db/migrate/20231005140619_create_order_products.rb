class CreateOrderProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :order_products do |t|
      t.references :order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
