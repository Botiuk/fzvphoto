# frozen_string_literal: true

class AddLocationToStadia < ActiveRecord::Migration[7.0]
  def change
    add_reference :stadia, :location, foreign_key: true
    change_column_null :stadia, :location_id, false
  end
end
