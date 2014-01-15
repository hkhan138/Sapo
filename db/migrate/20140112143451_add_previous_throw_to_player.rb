class AddPreviousThrowToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :previous_throw, :integer
  end
end
