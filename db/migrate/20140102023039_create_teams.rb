class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :team_name
      t.integer :total_score
      t.integer :turn_number
      t.belongs_to :game

      t.timestamps
    end
  end
end
