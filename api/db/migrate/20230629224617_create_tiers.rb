class CreateTiers < ActiveRecord::Migration[6.1]
  def change
    create_table :tiers do |t|
      t.references :district, null: false
      t.string :name, null: false
      t.timestamps
    end
  end
end
