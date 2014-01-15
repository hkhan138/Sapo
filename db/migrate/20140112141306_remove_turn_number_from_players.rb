class RemoveTurnNumberFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :turn_number, :integer
  end
end
