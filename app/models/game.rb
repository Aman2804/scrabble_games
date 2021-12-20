class Game < ApplicationRecord

  has_many :game_rounds, class_name: 'GameRoundDetail', dependent: :destroy
end
