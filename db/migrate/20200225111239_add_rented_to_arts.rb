class AddRentedToArts < ActiveRecord::Migration[5.2]
  def change
    change_column :arts, :available, :boolean, default: true
  end
end
