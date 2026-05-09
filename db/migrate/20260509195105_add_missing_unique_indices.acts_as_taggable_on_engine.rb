# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 2)
class AddMissingUniqueIndices < ActiveRecord::Migration[6.0]
  def self.up
    # ADDED: , if_not_exists: true
    add_index ActsAsTaggableOn.tags_table, :name, unique: true, if_not_exists: true

    # This conditional is already safe
    remove_index ActsAsTaggableOn.taggings_table, :tag_id if index_exists?(ActsAsTaggableOn.taggings_table, :tag_id)
    
    # ADDED: , if_exists: true
    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_taggable_context_idx', if_exists: true
    
    # ADDED: , if_not_exists: true
    add_index ActsAsTaggableOn.taggings_table,
              %i[tag_id taggable_id taggable_type context tagger_id tagger_type],
              unique: true, name: 'taggings_idx', if_not_exists: true
  end

  def self.down
    # ADDED: , if_exists: true
    remove_index ActsAsTaggableOn.tags_table, :name, if_exists: true

    # ADDED: , if_exists: true
    remove_index ActsAsTaggableOn.taggings_table, name: 'taggings_idx', if_exists: true

    add_index ActsAsTaggableOn.taggings_table, :tag_id unless index_exists?(ActsAsTaggableOn.taggings_table, :tag_id)
    add_index ActsAsTaggableOn.taggings_table, %i[taggable_id taggable_type context],
              name: 'taggings_taggable_context_idx', if_not_exists: true
  end
end