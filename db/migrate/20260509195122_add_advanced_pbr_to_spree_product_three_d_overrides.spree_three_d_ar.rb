# This migration comes from spree_three_d_ar (originally 20260508120652)
class AddAdvancedPbrToSpreeProductThreeDOverrides < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_product_three_d_overrides, :base_color_factor, :string, if_not_exists: true
    add_column :spree_product_three_d_overrides, :metallic_factor, :float, if_not_exists: true
    add_column :spree_product_three_d_overrides, :roughness_factor, :float, if_not_exists: true
    add_column :spree_product_three_d_overrides, :emissive_factor, :string, if_not_exists: true
  end
end
