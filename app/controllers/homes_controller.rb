class HomesController < ApplicationController
  def index
  end

  def show
  end

  def new_guest
    user = User.find_or_create_by!(email: 'new_guest@example.com', name:"guest") do |user|
      user.password = SecureRandom.urlsafe_base64 #passwordrランダム生成
    end
    sign_in user
    redirect_to games_path, notice: 'ゲストユーザーとしてログインしました。'
  end
end
