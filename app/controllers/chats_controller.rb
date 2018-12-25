# frozen_string_literal: true

class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
    @connected_users = User.where(id: ConnectedList.all(params[:id]))
                           .where.not(id: current_user.id)
    gon.push(chat_id: @chat.id)
  end

end
