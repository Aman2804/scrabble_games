class GameRoundDetail < ApplicationRecord
  serialize :score_card, Array

  enum status: { 
                  started: 0, draw: 1, finished: 2
               }

  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  belongs_to :game
  belongs_to :winner, class_name: 'User', optional: true

  before_validation :set_status
  after_create_commit :update_users_detail

  validates_presence_of :status
  validate :check_players
  # validates_presence_of :winner, if: Proc.new{|a| a.status == 'finished'}
  validate :check_score_card, if: Proc.new {|a| !a.new_record? }
  validate :check_status

  def winner_user_list
    [
      [self.player1.name, self.player1_id],
      [self.player2.name, self.player2_id]
    ]
  end


  private

    def check_players
      errors.add :players_invalid, 'both player can not be same' if player2 == player1
    end

    def check_score_card
      errors.add :score_card, 'is invalid, Please enter valid scores' unless score_card.reject(&:empty?).size == 2 and !( winner.present? and score_card[0] == score_card[1] )
      errors.add :winner_invalid, 'select any' unless score_card[0] == score_card[1] or  winner.present?
    end

    def check_status
      errors.add :invalid_status, 'update valid status' if (score_card.present? or winner.present?) and status == 'started'
    end

    def set_status
      if self.new_record?
        self.status = 'started'
      elsif score_card[0].to_i == score_card[1].to_i
        self.status = 'draw'
      elsif winner.present?
        self.status = 'finished'
      end
      self.status
    end

    def update_users_detail
      self.player2.update_attributes(participation: (self.player2.participation + 1))
      self.player1.update_attributes(participation: (self.player1.participation + 1))
    end
end
