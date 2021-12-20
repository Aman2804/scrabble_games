class HomeController < ApplicationController

  def index
    @users = User.where("participation >= 10").sort{|a| a.get_game_details[:avg_score]}.first(10)
  end
end
