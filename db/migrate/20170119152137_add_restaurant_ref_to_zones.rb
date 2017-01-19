class AddRestaurantRefToZones < ActiveRecord::Migration[5.0]
  def change
    add_reference :zones, :restaurant, foreign_key: true
  end
end
