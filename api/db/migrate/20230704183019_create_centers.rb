class CreateCenters < ActiveRecord::Migration[6.1]
  def change
    create_table :centers do |t|
      t.references :district, null: false
      t.string :name, null: false
      t.integer :rating, null: false
      t.timestamps
    end
  end
end
