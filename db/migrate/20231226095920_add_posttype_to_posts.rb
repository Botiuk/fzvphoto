# frozen_string_literal: true

class AddPosttypeToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :posttype, :integer
  end
end
