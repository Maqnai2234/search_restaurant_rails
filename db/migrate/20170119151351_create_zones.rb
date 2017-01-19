class CreateZones < ActiveRecord::Migration[5.0]
  def change
    create_table :zones do |t|
      t.string :address
      t.string :schedule

      t.timestamps
    end
  end
end
