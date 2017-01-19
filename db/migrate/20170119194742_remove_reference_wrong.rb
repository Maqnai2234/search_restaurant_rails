class RemoveReferenceWrong < ActiveRecord::Migration[5.0]
  def change
    remove_reference(:restaurants, :specialty, index: true)
  end
end
