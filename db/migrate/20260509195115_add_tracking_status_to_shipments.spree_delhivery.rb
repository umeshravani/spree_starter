# This migration comes from spree_delhivery (originally 20250101000002)
class AddTrackingStatusToShipments < ActiveRecord::Migration[7.0]
  def change
    # Only add 'tracking_status' if it doesn't exist
    unless column_exists?(:spree_shipments, :tracking_status)
      add_column :spree_shipments, :tracking_status, :string
    end

    # Only add 'delhivery_response_data' if it doesn't exist
    unless column_exists?(:spree_shipments, :delhivery_response_data)
      add_column :spree_shipments, :delhivery_response_data, :jsonb
    end
  end
end