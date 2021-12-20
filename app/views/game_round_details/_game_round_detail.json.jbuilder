json.extract! game_round_detail, :id, :player1_id, :palyer2_id, :winner_id, :status, :created_at, :updated_at
json.url game_round_detail_url(game_round_detail, format: :json)
