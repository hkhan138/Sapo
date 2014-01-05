class AddTeamTurnToGames < ActiveRecord::Migration
  def change
    add_column :games, :team_turn, :integer
  end
end
