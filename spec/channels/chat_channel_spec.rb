# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChatChannel, type: :channel do
  it "subscribes to a stream" do
    subscribe(chat_id: 1)

    expect(subscription).to be_confirmed
    expect(streams).to include("chat_channel_1")
  end
end
