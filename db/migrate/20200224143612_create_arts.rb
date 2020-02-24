class CreateArts < ActiveRecord::Migration[5.2]
  def change
    create_table :arts do |t|
      t.string :name
      t.string :artist
      t.string :era
      t.string :style
      t.integer :price
      t.text :description
      t.string :address
      t.boolean :available
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
