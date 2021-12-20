class User < ApplicationRecord

  validates_presence_of :name, :contact
  validates_uniqueness_of :contact

  def get_game_details
    participations = GameRoundDetail.where('player1_id or player2_id = ?', self.id)
    win = GameRoundDetail.where('winner_id = ?', self.id).count
    total_scores = participations.map{|a| a.player1_id == self.id ? a.score_card[0].to_i : a.score_card[1].to_i }.sum.to_f
    {total_scores: total_scores, avg_score: (total_scores/participations.count).round(2), win: win, loose: (participations.count - win).abs }
  end

  def highest_score_detail
    participations = GameRoundDetail.where('player1_id or player2_id = ?', self.id)
    detail = Hash.new
    participations.each do |participation|
      score = participation.player1_id == self.id ? participation.score_card[0] : participation.score_card[1]
      if detail[:top_score].to_i < score.to_i
        detail[:top_score] = score.to_i
        detail[:game_name] = participation.game.name
        detail[:opponent] = participation.player1_id == self.id ? participation.player2.name : participation.player1.name
      end
    end
    detail
  end

end
