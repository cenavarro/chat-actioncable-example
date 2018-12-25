# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChatUsersChannel, type: :channel do
  let(:user) { create(:user) }

  before { stub_connection(current_user: user) }

  describe "subscribed" do
    it "subscribes to a stream" do
      subscribe(chat_id: 1)

      expect(subscription).to be_confirmed
      expect(streams).to include("chat_channel_users_1")
    end

    it "adds current user to connected list" do
      expect(ConnectedList).to receive(:add).with(1, user.id)
      subscribe(chat_id: 1)
    end

    it "broadcasts the new connection" do
      expect(ActionCable).to receive_message_chain(:server, :broadcast).with(
        "chat_channel_users_2",
        type: "connected",
        id: user.id,
        html: kind_of(String)
      )
      subscribe(chat_id: 2)
    end
  end

  describe "unsubscribed" do
    before { subscribe(chat_id: 2) }

    it "removes current user from connected list" do
      expect(ConnectedList).to receive(:remove).with(2, user.id)
      subscription.unsubscribe_from_channel
    end

    it "broadcasts the disconnection" do
      expect(ActionCable).to receive_message_chain(:server, :broadcast).with(
        "chat_channel_users_2",
        type: "disconnected",
        id: user.id
      )
      subscription.unsubscribe_from_channel
    end
  end
end
