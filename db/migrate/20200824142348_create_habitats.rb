class CreateHabitats < ActiveRecord::Migration[6.0]
  def change
    create_table :habitats do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :subregion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
