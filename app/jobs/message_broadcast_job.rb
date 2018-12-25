# frozen_string_literal: true

class MessageBroadcastJob < ApplicationJob

  queue_as :default

  def perform(message)
    ActionCable.server.broadcast(
      "chat_channel_#{message.chat_id}",
      id: message.id,
      html: render_message(message)
    )
  end

  private

  def render_message(message)
    MessagesController.render(
      partial: "chats/message",
      locals: {
        message: message,
        creator: false
      }
    )
  end

end
