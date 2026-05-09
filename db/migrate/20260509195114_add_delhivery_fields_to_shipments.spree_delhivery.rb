# This migration comes from spree_delhivery (originally 20250101000001)
class AddDelhiveryFieldsToShipments < ActiveRecord::Migration[6.1]
    def change
      add_column :spree_shipments, :delhivery_waybill, :string, if_not_exists: true
      add_column :spree_shipments, :delhivery_ref_id, :string, if_not_exists: true
      add_column :spree_shipments, :delhivery_label_url, :text, if_not_exists: true
      add_column :spree_shipments, :delhivery_response_data, :json, if_not_exists: true
      
      add_index :spree_shipments, :delhivery_waybill, if_not_exists: true
    end
  end