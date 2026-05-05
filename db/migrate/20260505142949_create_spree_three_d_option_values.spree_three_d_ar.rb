class CreateSpreeThreeDOptionValues < ActiveRecord::Migration[8.0]
  def change
    create_table :spree_three_d_option_values, if_not_exists: true do |t|
      t.references :three_d_option_type, null: false, foreign_key: { to_table: :spree_three_d_option_types }
      t.string :name
      t.string :presentation
      t.string :color_code

      t.timestamps
    end
  end
end