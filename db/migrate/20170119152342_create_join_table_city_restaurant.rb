class CreateJoinTableCityRestaurant < ActiveRecord::Migration[5.0]
  def change
    create_join_table :cities, :restaurants do |t|
      # t.index [:city_id, :restaurant_id]
      # t.index [:restaurant_id, :city_id]
    end
  end
end
