# This migration comes from spree_three_d_ar (originally 20260505104353)
class AddVisibleInStorefrontToSpreeThreeDMaterials < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_three_d_materials, :visible_in_storefront, :boolean, default: true
  end
end