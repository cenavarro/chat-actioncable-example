# frozen_string_literal: true

class Message < ApplicationRecord

  belongs_to :chat
  belongs_to :user

  validates :body, :chat, :user, presence: true

  after_create_commit :broadcast_message

  private

  def broadcast_message
    MessageBroadcastJob.perform_later(self)
  end

end
