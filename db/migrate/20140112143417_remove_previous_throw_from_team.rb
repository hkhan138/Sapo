class RemovePreviousThrowFromTeam < ActiveRecord::Migration
  def change
    remove_column :teams, :previous_throw, :integer
  end
end
