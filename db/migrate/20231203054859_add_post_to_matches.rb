class AddPostToMatches < ActiveRecord::Migration[7.0]
  def change
    add_reference :matches, :post, null: false, foreign_key: true
  end
end
