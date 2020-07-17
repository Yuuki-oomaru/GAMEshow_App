class GamesController < ApplicationController
  def index
    if params[:tag]
      @games = Game.tagged_with(params[:tag])
    else
      @games = Game.all
    end
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
    @game_comment = GameComment.new
  end

  def create
    @games = Game.all
    @game = Game.new(game_params)
    @game.user_id = current_user.id
    @game.save
  end

  def new
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_params)
    redirect_to game_path(@game.id), notice: "successfully updated !"
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    redirect_to games_path
  end

  private
   def game_params
     params.require(:game).permit(:title, :body, :game_image, :tag_list)
   end
end
