# This migration comes from spree_google_products (originally 20260112000000)
class AddSpreeGoogleShoppingTables < ActiveRecord::Migration[7.0]
    def change
      create_table :spree_google_credentials do |t|
        t.references :store, null: false, index: true
        
        # Auth & Security
        t.string :merchant_center_id
        t.string :ad_account_id
        t.text   :access_token
        t.text   :refresh_token
        t.string :scope
        t.string :email
        t.datetime :token_expires_at
        t.datetime :last_sync_at
        
        # Targeting Configuration
        t.string :target_country, default: 'US'
        t.string :target_currency, default: 'USD'
        
        # Global Defaults
        t.string  :default_google_product_category
        t.string  :default_product_type
        t.integer :default_min_handling_time
        t.integer :default_max_handling_time
        
        t.timestamps
      end

      create_table :spree_google_product_attributes do |t|
        t.references :product, null: false, index: true
        
        # Core Attributes
        t.string :brand
        t.string :gtin
        t.string :mpn
        t.boolean :identifier_exists, default: true
        
        # Categorization
        t.string :google_product_category
        t.string :product_type
        
        # Demographics
        t.string :condition, default: 'new'
        t.string :gender
        t.string :age_group
        t.string :color
        t.string :size
        t.string :material
        
        # Status & Feedback
        t.string :google_status
        t.text   :google_issues
        
        # Extra Data
        t.string :custom_label_0
        
        # Sale Logic
        t.datetime :sale_start_at
        t.datetime :sale_end_at
        
        # Shipping Overrides
        t.integer :min_handling_time
        t.integer :max_handling_time
  
        t.timestamps
      end
  
      create_table :spree_google_variant_attributes do |t|
        t.references :variant, null: false, index: true
        
        # Identification Overrides
        t.string :gtin
        t.string :mpn
        
        # Status Syncing
        t.string :google_status, index: true
        t.text   :google_issues
        t.datetime :last_synced_at
        
        t.timestamps
      end
  
      create_table :spree_google_taxons do |t|
        t.string :name, index: true
        t.string :google_id, index: true
      end
  
    end
  end