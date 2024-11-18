# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.date :match_date
      t.references :home_team, null: false
      t.references :visitor_team, null: false
      t.integer :home_team_goal
      t.integer :visitor_team_goal
      t.references :tournament, null: false, foreign_key: true
      t.references :stadium, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :matches, :teams, column: :home_team_id
    add_foreign_key :matches, :teams, column: :visitor_team_id
  end
end
