# This migration comes from spree_three_d_ar (originally 20260505111441)
class AddDisplayNameToSpreeThreeDMaterials < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_three_d_materials, :display_name, :string, if_not_exists: true
  end
end
