class CreateTuitionCredits < ActiveRecord::Migration[6.1]
  def change
    create_table :tuition_credits do |t|
      t.references :tier, foreign_key: true, index: true
      t.integer :rating, null: false
      t.integer :full_day_credit, null: false
      t.integer :half_day_credit, null: false
      t.integer :extended_day_credit, null: false
      t.timestamps
    end
  end
end
