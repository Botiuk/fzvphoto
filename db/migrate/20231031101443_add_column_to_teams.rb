class AddColumnToTeams < ActiveRecord::Migration[7.0]
  def change
    add_column :teams, :represent, :string
  end
end
