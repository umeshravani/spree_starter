# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 4)
class AddMissingTaggableIndex < ActiveRecord::Migration[6.0]
  def self.up
    # ADDED: if_not_exists: true
    add_index ActsAsTaggableOn.taggings_table, %i[taggable_id taggable_type context],
              name: 'taggings_taggable_context_idx', if_not_exists: true
  end

  def self.down
    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_taggable_context_idx', if_exists: true
  end
end