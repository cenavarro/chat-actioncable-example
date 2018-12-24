class MessagesController < ApplicationController

  before_action :set_chat

  def create
    message = @chat.messages.new(message_params)
    message.user = current_user

    if message.save
      render json: { html: render_message(message) }, status: :created
    else
      render json: { errors: message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_chat
    @chat = Chat.find(params[:chat_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end

  def render_message(message)
    MessagesController.render(
      partial: "chats/message",
      locals: {
        message: message,
        creator: true
      }
    )
  end
end
