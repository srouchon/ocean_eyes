class AddLongAndLatToHabitats < ActiveRecord::Migration[6.0]
  def change
    add_column :habitats, :long, :float
    add_column :habitats, :lat, :float
  end
end
