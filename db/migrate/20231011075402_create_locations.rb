class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :country
      t.string :region
      t.string :district
      t.integer :loctype
      t.string :name

      t.timestamps
    end
  end
end
