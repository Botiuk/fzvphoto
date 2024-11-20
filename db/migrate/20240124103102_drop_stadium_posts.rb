# frozen_string_literal: true

class DropStadiumPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :stadium_posts do |t|
      t.references :stadium, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
