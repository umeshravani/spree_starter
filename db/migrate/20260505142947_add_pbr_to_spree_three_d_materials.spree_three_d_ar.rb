# This migration comes from spree_three_d_ar (originally 20260504114548)
class AddPbrToSpreeThreeDMaterials < ActiveRecord::Migration[8.1]
  def change
    add_column :spree_three_d_materials, :base_color, :string, if_not_exists: true
    add_column :spree_three_d_materials, :metallic_factor, :float, if_not_exists: true
    add_column :spree_three_d_materials, :roughness_factor, :float, if_not_exists: true
  end
end
