# frozen_string_literal: true

class AddPostToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :post, foreign_key: true
    change_column_null :matches, :post_id, false
  end
end
