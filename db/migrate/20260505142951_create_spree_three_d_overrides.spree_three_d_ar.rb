# This migration comes from spree_three_d_ar (originally 20260504141722)
class CreateSpreeThreeDOverrides < ActiveRecord::Migration[7.0] # (Your version number here might vary, leave whatever Rails generated)
  def change
    create_table :spree_three_d_overrides, if_not_exists: true do |t|
      # Link to the Spree Product
      t.references :product, null: false, foreign_key: { to_table: :spree_products }
      
      # Link to our 3D Material
      t.references :three_d_material, null: false, foreign_key: { to_table: :spree_three_d_materials }

      t.timestamps
    end
  end
end
