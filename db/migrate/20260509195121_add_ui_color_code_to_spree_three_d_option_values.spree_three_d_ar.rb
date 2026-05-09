# This migration comes from spree_three_d_ar (originally 20260507144530)
class AddUiColorCodeToSpreeThreeDOptionValues < ActiveRecord::Migration[8.0]
  def change
    add_column :spree_three_d_option_values, :ui_color_code, :string, if_not_exists: true
  end
end
