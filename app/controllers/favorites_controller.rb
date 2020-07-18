class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def create
    @game = Game.find(params[:game_id])
   @favorite = current_user.favorites.new(game_id: @game.id)
   @favorite.save
  end

  def destroy
    @game = Game.find(params[:game_id])
   @favorite = current_user.favorites.find_by(game_id: @game.id)
   @favorite.destroy
  end

end
