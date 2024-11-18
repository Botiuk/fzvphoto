# frozen_string_literal: true

class CreatePostAboutStadia < ActiveRecord::Migration[7.0]
  def change
    create_table :post_about_stadia do |t|
      t.references :post, null: false, foreign_key: true
      t.references :stadium, null: false, foreign_key: true

      t.timestamps
    end
  end
end
