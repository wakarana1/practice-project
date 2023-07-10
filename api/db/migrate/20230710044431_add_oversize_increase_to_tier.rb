class AddOversizeIncreaseToTier < ActiveRecord::Migration[6.1]
  def change
    add_column :tiers, :oversize_increase, :integer, null: false, default: 0
  end
end
