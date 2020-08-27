class RemoveSubregionIdFromHabitats < ActiveRecord::Migration[6.0]
  def change
    remove_reference :habitats, :subregion, null: false, foreign_key: true
  end
end
