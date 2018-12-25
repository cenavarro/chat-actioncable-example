# frozen_string_literal: true

class ChatUsersChannel < ApplicationCable::Channel

  def subscribed
    stream_from "chat_channel_users_#{params[:chat_id]}"
    ConnectedList.add(params[:chat_id], current_user.id)
    ActionCable.server.broadcast(
      "chat_channel_users_#{params[:chat_id]}",
      type: "connected",
      id: current_user.id,
      html: render_chat_user
    )
  end

  def unsubscribed
    ConnectedList.remove(params[:chat_id], current_user.id)
    ActionCable.server.broadcast(
      "chat_channel_users_#{params[:chat_id]}",
      type: "disconnected",
      id: current_user.id
    )
  end

  private

  def render_chat_user
    ChatsController.render(
      partial: "chats/connected_user",
      locals: { user: current_user }
    )
  end

end
