# This migration comes from spree_three_d_ar (originally 20260504124925)
class CreateSpreeThreeDOptionValues < ActiveRecord::Migration[7.0] # Your version may vary
  def change
    create_table :spree_three_d_option_values do |t|
      # FIX: Explicitly point to the spree_ prefixed table
      t.references :three_d_option_type, null: false, foreign_key: { to_table: :spree_three_d_option_types }
      t.string :name
      t.string :presentation
      t.string :color_code

      t.timestamps
    end
  end
end