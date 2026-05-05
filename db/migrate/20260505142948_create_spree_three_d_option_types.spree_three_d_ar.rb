# This migration comes from spree_three_d_ar (originally 20260504124923)
class CreateSpreeThreeDOptionTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :spree_three_d_option_types, if_not_exists: true do |t|
      t.string :name
      t.string :presentation
      t.string :kind

      t.timestamps
    end
  end
end
