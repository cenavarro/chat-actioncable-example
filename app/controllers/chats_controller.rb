# frozen_string_literal: true

class ChatsController < ApplicationController

  before_action :authenticate_user!

  def index
    @chats = Chat.all
  end

  def show
    @chat = Chat.find(params[:id])
  end

end
