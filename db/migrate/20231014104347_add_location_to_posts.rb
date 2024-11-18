# frozen_string_literal: true

class AddLocationToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :location, foreign_key: true
    change_column_null :posts, :location_id, false
  end
end
