# This migration comes from spree_three_d_ar (originally 20260504124925)
class CreateSpreeThreeDMaterialOptionValues < ActiveRecord::Migration[7.0]
  def change
    create_table :spree_three_d_material_option_values, if_not_exists: true do |t|
      t.references :three_d_material, 
                   null: false, 
                   foreign_key: { to_table: :spree_three_d_materials }, 
                   index: { name: 'idx_spree_3d_mat_opt_val_on_mat_id' }
                   
      t.references :three_d_option_value, 
                   null: false, 
                   foreign_key: { to_table: :spree_three_d_option_values }, 
                   index: { name: 'idx_spree_3d_mat_opt_val_on_val_id' }

      t.timestamps
    end
  end
end
