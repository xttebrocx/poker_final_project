class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :game_bank
      t.integer :big_blind
      t.integer :small_blind
      t.integer :game_owner
      t.string :game_name

      t.timestamps
    end
  end
end
