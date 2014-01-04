class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :player_name
      t.integer :score
      t.integer :turn_number
      t.belongs_to :team

      t.timestamps
    end
  end
end
