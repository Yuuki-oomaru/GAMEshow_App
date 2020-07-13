class MessagesController < ApplicationController
  def show
    @user = User.find(params[:id])
    rooms = current_user.entries.pluck(:room_id)  #Entryモデル内のカラムを一覧表示。
    entries = Entry.find_by(user_id: @user.id, room_id: rooms)

    unless entries.nil?
      @room = entries.room
    else
      @room = Room.new
      @room.save
      Entry.create(user_id: current_user.id, room_id: @room.id)
      Entry.create(user_id: @user.id, room_id: @room.id)
    end
    @messages = @room.messages
    @message = Message.new(room_id: @room.id)
  end
  def create
    @message = current_user.messages.new(message_params)
    @message.save
    @entries = Entry.find_by(room_id: @message.room_id, user_id:current_user.id)
    @room = @entries.room
    @messages = @room.messages
  end

  private
  def message_params
    params.require(:message).permit(:message, :room_id)
  end
end
