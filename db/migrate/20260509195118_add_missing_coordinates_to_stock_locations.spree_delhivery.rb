# This migration comes from spree_delhivery (originally 20251227123158)
class AddMissingCoordinatesToStockLocations < ActiveRecord::Migration[7.1]
  def change
    # 1. Add Latitude if missing
    unless column_exists?(:spree_stock_locations, :latitude)
      add_column :spree_stock_locations, :latitude, :decimal, precision: 10, scale: 6, if_not_exists: true
    end

    # 2. Add Longitude if missing
    unless column_exists?(:spree_stock_locations, :longitude)
      add_column :spree_stock_locations, :longitude, :decimal, precision: 10, scale: 6, if_not_exists: true
    end
    
    # 3. Double-check Warehouse Name (Just in case)
    unless column_exists?(:spree_stock_locations, :delhivery_warehouse_name)
      add_column :spree_stock_locations, :delhivery_warehouse_name, :string, if_not_exists: true
    end
  end
end