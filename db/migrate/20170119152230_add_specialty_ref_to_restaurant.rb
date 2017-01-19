class AddSpecialtyRefToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_reference :restaurants, :specialty, foreign_key: true
  end
end
