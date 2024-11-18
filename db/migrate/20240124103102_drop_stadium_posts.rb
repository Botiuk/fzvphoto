# frozen_string_literal: true

class DropStadiumPosts < ActiveRecord::Migration[7.0]
  def change
    drop_table :stadium_posts
  end
end
