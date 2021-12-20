class GameRoundDetailsController < InheritedResources::Base

  private

    def game_round_detail_params
      params.require(:game_round_detail).permit(:player1_id, :palyer2_id, :winner_id, :status)
    end

end
