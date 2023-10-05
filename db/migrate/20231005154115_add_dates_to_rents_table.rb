class AddDatesToRentsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :rents, :start_date, :date
    add_column :rents, :end_date, :date
    add_reference :rents, :user, null: false, foreign_key: true
    add_reference :rents, :product, null: false, foreign_key: true
  end
end
