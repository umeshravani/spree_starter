# This migration comes from spree_delhivery (originally 20250101000001)
class AddDelhiveryFieldsToShipments < ActiveRecord::Migration[6.1]
    def change
      add_column :spree_shipments, :delhivery_waybill, :string
      add_column :spree_shipments, :delhivery_ref_id, :string
      add_column :spree_shipments, :delhivery_label_url, :text
      add_column :spree_shipments, :delhivery_response_data, :json # Store full debug response
      
      add_index :spree_shipments, :delhivery_waybill
    end
  end