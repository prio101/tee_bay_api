class CreateRents < ActiveRecord::Migration[7.0]
  def change
    create_table :rents do |t|
      t.string :status
      t.decimal :price

      t.timestamps
    end
  end
end
