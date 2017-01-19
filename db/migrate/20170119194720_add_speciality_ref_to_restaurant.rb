class AddSpecialityRefToRestaurant < ActiveRecord::Migration[5.0]
  def change
    add_reference :restaurants, :speciality, foreign_key: true
  end
end
