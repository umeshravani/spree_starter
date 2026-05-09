# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 3)
class AddTaggingsCounterCacheToTags < ActiveRecord::Migration[6.0]
  def self.up
    add_column ActsAsTaggableOn.tags_table, :taggings_count, :integer, default: 0, if_not_exists: true

    ActsAsTaggableOn::Tag.reset_column_information
    ActsAsTaggableOn::Tag.find_each do |tag|
      # FIX: We changed ActsAsTaggableOn.taggings_table to the symbol :taggings
      ActsAsTaggableOn::Tag.reset_counters(tag.id, :taggings)
    end
  end

  def self.down
    remove_column ActsAsTaggableOn.tags_table, :taggings_count, if_exists: true
  end
end