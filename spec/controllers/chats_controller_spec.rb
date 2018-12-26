# frozen_string_literal: true

require "rails_helper"

RSpec.describe ChatsController, type: :controller do
  let!(:user) { create(:user) }

  before { sign_in(user) }

  describe "GET #index" do
    let!(:chat_1) { create(:chat) }
    let!(:chat_2) { create(:chat) }

    it "assigns @chats correctly" do
      get :index
      expect(assigns(:chats)).to match_array([chat_1, chat_2])
    end

    it "returns correct status" do
      get :index
      expect(response).to be_ok
    end
  end

  describe "GET #show" do
    include_context :gon

    let(:chat) { create(:chat) }

    it "assigns @chat correctly" do
      get :show, params: { id: chat.id }
      expect(assigns(:chat)).to eq(chat)
    end

    it "assigns @connected_users correctly" do
      other_user = create(:user)
      ConnectedList.add(chat.id, other_user.id)
      get :show, params: { id: chat.id }
      expect(assigns(:connected_users)).to eq([other_user])
    end

    it "gonifies as expected" do
      get :show, params: { id: chat.id }
      expect(gon["chat_id"]).to eq(chat.id)
    end

    it "returns correct status" do
      get :show, params: { id: chat.id }
      expect(response).to be_ok
    end
  end
end
