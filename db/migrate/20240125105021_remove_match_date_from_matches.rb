class RemoveMatchDateFromMatches < ActiveRecord::Migration[7.0]
  def change
    remove_column :matches, :match_date, :date
  end
end
