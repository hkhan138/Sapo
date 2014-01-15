class AddPreviousThrowToTeam < ActiveRecord::Migration
  def change
    add_column :teams, :previous_throw, :integer
  end
end
