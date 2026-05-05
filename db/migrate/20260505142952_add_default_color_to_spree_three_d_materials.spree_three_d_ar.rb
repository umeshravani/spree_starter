# This migration comes from spree_three_d_ar (originally 20260504150444)
class AddDefaultColorToSpreeThreeDMaterials < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_three_d_materials, :default_three_d_option_value_id, :integer, if_not_exists: true
  end
end
