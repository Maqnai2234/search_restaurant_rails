class AddCityRefToZones < ActiveRecord::Migration[5.0]
  def change
    add_reference :zones, :city, foreign_key: true
  end
end
