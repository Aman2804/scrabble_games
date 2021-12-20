class CreateGameRoundDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :game_round_details do |t|
      t.bigint :player1_id
      t.bigint :player2_id
      t.bigint :game_id
      t.bigint :winner_id
      t.integer :status
      t.text :score_card

      t.timestamps
    end
  end
end
