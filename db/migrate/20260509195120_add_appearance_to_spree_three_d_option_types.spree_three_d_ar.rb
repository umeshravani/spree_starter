# This migration comes from spree_three_d_ar (originally 20260507144528)
class AddAppearanceToSpreeThreeDOptionTypes < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_three_d_option_types, :appearance, :string, if_not_exists: true
  end
end
