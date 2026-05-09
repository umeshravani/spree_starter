# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 7)
class AddTenantToTaggings < ActiveRecord::Migration[6.0]
  def self.up
    # ADDED: if_not_exists: true
    add_column ActsAsTaggableOn.taggings_table, :tenant, :string, limit: 128, if_not_exists: true
    add_index ActsAsTaggableOn.taggings_table, :tenant unless index_exists? ActsAsTaggableOn.taggings_table, :tenant
  end

  def self.down
    remove_index ActsAsTaggableOn.taggings_table, :tenant if index_exists? ActsAsTaggableOn.taggings_table, :tenant
    remove_column ActsAsTaggableOn.taggings_table, :tenant, if_exists: true
  end
end