class AddLocationToStadia < ActiveRecord::Migration[7.0]
  def change
    add_reference :stadia, :location, null: false, foreign_key: true
  end
end
