# This migration comes from spree_delhivery (originally 20251227112401)
class AddGeolocationToStockLocations < ActiveRecord::Migration[7.1] # or your current version
  def change
    add_column :spree_stock_locations, :latitude, :decimal, precision: 10, scale: 6
    add_column :spree_stock_locations, :longitude, :decimal, precision: 10, scale: 6
    
    # Optional: Add an index if you plan to search by location (e.g., "nearest store")
    add_index :spree_stock_locations, [:latitude, :longitude]
  end
end