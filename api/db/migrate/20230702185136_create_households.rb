class CreateHouseholds < ActiveRecord::Migration[6.1]
  def change
    create_table :households do |t|
      t.references :tier, foreign_key: true, index: true
      t.integer :household_size, null: false
      t.integer :income_max, null: false
      t.integer :income_min, null: false, default: 0
      t.timestamps
    end
  end
end
