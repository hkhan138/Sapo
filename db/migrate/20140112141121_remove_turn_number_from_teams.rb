class RemoveTurnNumberFromTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :turn_number, :integer
  end
end
