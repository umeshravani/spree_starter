# This migration comes from spree_product_reviews (originally 20260105145731)
class AddSpamToSpreeProductReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :spree_product_reviews, :spam, :boolean, default: false, index: true
  end
end
