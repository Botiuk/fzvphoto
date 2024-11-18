# frozen_string_literal: true

class RemoveBodyFromPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :body, :text
  end
end
