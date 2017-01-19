class ChangeNameTableSpecialty < ActiveRecord::Migration[5.0]
  def change
   rename_table :specialties, :specialities
 end
end
