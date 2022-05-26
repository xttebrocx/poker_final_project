class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end
end
