class CreateRentals < ActiveRecord::Migration[5.2]
  def change
    create_table :rentals do |t|
      t.string :address
      t.date :rental_start
      t.date :rental_end
      t.integer :total_price
      t.references :user, foreign_key: true
      t.references :art, foreign_key: true

      t.timestamps
    end
  end
end
