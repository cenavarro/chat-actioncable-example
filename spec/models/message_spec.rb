# frozen_string_literal: true

require "rails_helper"

RSpec.describe Message do
  describe "associations" do
    it { is_expected.to belong_to(:chat) }
    it { is_expected.to belong_to(:user) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:chat) }
    it { is_expected.to validate_presence_of(:user) }
    it { is_expected.to validate_presence_of(:body) }
  end

  describe "after commit hooks" do
    let(:message) { build(:message) }

    it "broadcasts the new message after created" do
      expect(MessageBroadcastJob).to receive(:perform_later).with(message)
      message.save
    end
  end
end
