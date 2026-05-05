# This migration comes from spree_three_d_ar (originally 20260504081022)
# This migration comes from spree_three_d_ar (originally 20260504081022)
class CreateThreeDArTables < ActiveRecord::Migration[7.1] # Check your exact Rails version
  def change
    # 1. Categories
    create_table :spree_three_d_categories, if_not_exists: true do |t|
      t.string :name
      t.timestamps
    end

    # 2. Models
    create_table :spree_three_d_models, if_not_exists: true do |t|
      t.string :name
      t.string :placement, default: 'wall' # wall, floor
      t.string :variant_type, default: 'single' # single, multi
      t.references :three_d_category, foreign_key: { to_table: :spree_three_d_categories }
      t.timestamps
    end

    # 3. Materials (Sub-meshes inside the GLB)
    create_table :spree_three_d_materials, if_not_exists: true do |t|
      t.string :mesh_name
      t.references :three_d_model, foreign_key: { to_table: :spree_three_d_models }
      t.timestamps
    end

    # 4. Overrides (Product specific textures)
    create_table :spree_product_three_d_overrides, if_not_exists: true do |t|
      t.references :product, foreign_key: { to_table: :spree_products }
      t.references :three_d_material, foreign_key: { to_table: :spree_three_d_materials }
      t.timestamps
    end

    # 5. Attach Model to Product
    add_reference :spree_products, :three_d_model, foreign_key: { to_table: :spree_three_d_models }, if_not_exists: true
  end
end
