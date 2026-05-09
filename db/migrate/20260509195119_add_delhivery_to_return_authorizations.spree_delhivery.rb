# This migration comes from spree_delhivery (originally 20251228081459)
class AddDelhiveryToReturnAuthorizations < ActiveRecord::Migration[7.0]
  def change
    # FIX: Use 'spree_return_authorizations', not 'return_authorizations'
    add_column :spree_return_authorizations, :delhivery_waybill, :string, if_not_exists: true
    add_column :spree_return_authorizations, :delhivery_ref_id, :string, if_not_exists: true
    add_column :spree_return_authorizations, :delhivery_label_url, :string, if_not_exists: true
  end
end