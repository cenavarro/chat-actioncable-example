# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessageBroadcastJob, type: :job do
  describe "#perform_later" do
    let!(:message) { create(:message) }

    before { ActiveJob::Base.queue_adapter = :test }

    it "enqueues the job for broadcasting the message" do
      expect do
        described_class.perform_later(message)
      end.to have_enqueued_job
    end
  end

  describe "#perform" do
    let(:chat) { create(:chat) }
    let!(:message) { create(:message, chat: chat) }

    it "broadcasts the message using ActionCable" do
      expect(ActionCable).to receive_message_chain(:server, :broadcast).with(
        "chat_channel_#{chat.id}",
        id: message.id,
        html: kind_of(String)
      )
      described_class.new.perform(message)
    end
  end
end
