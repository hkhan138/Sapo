class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_name
      t.integer :score_limit
      t.integer :number_of_players
      t.integer :winner_team
      
      t.timestamps
    end
  end
end
