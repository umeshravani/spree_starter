# frozen_string_literal: true

# This migration comes from acts_as_taggable_on_engine (originally 1)
class ActsAsTaggableOnMigration < ActiveRecord::Migration[6.0]
  def self.up
    # ADDED: if_not_exists: true
    create_table ActsAsTaggableOn.tags_table, if_not_exists: true do |t|
      t.string :name
      t.timestamps
    end

    # ADDED: if_not_exists: true
    create_table ActsAsTaggableOn.taggings_table, if_not_exists: true do |t|
      t.references :tag, foreign_key: { to_table: ActsAsTaggableOn.tags_table }

      # You should make sure that the column created is
      # long enough to store the required class names.
      t.references :taggable, polymorphic: true
      t.references :tagger, polymorphic: true

      # Limit is created to prevent MySQL error on index
      # length for MyISAM table type: http://bit.ly/vgW2Ql
      t.string :context, limit: 128

      t.datetime :created_at
    end

    # ADDED: if_not_exists: true
    add_index ActsAsTaggableOn.taggings_table, %i[taggable_id taggable_type context],
              name: 'taggings_taggable_context_idx', if_not_exists: true
  end

  def self.down
    drop_table ActsAsTaggableOn.taggings_table, if_exists: true
    drop_table ActsAsTaggableOn.tags_table, if_exists: true
  end
end