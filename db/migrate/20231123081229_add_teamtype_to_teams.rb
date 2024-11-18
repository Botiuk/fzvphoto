# frozen_string_literal: true

class AddTeamtypeToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :teamtype, :string
  end
end
