class GamesController < InheritedResources::Base

  private

    def game_params
      params.require(:game).permit(:name)
    end

end
