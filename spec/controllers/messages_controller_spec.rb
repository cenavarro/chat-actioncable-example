# frozen_string_literal: true

require "rails_helper"

RSpec.describe MessagesController, type: :controller do
  let!(:chat) { create(:chat) }
  let!(:user) { create(:user) }

  before { sign_in(user) }

  describe "POST #create" do
    let(:action) do
      -> { post :create, params: { chat_id: chat.id, message: message_attributes }, format: :json }
    end

    context "with valid params" do
      let(:message_attributes) { { body: "Just some content" } }

      it "adds the message to the correct chat" do
        expect { action.call }.to change(chat.messages, :count).by(1)
      end

      it "adds the message to the correct user" do
        expect { action.call }.to change(user.messages, :count).by(1)
      end

      it "responds with correct data" do
        action.call
        parsed_json = JSON.parse(response.body)
        expect(parsed_json["html"]).not_to be_blank
      end

      it "responds with :created status" do
        action.call
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      let(:message_attributes) { { body: "" } }

      it "responds with correct data" do
        action.call
        parsed_json = JSON.parse(response.body)
        expect(parsed_json["errors"]).to eq(["Body can't be blank"])
      end

      it "responds with :unprocessable_entity status" do
        action.call
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
