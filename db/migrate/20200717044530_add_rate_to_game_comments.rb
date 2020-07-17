class AddRateToGameComments < ActiveRecord::Migration[5.2]
  def change
    add_column :game_comments, :rate, :float
  end
end
