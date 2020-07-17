class GameCommentsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @comment = current_user.game_comments.new(game_comment_params)
    @comment.game_id = @game.id
    @game_comments = @game.game_comments.order(id: "DESC")
    if @comment.save
      flash.now[:comment] = "successfully."
    else
      flash.now[:comment] = "投稿に失敗しました"
    end
  end

  def destroy
    @game_comment = GameComment.find(params[:id])
    @game = @game_comment.game
    @game_comment.destroy
    @game_comments = @game.game_comments.order(id: "DESC")
  end

  private
  def game_comment_params
    params.require(:game_comment).permit(:comment)
  end
end
