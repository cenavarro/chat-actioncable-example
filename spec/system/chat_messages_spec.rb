require "rails_helper"

RSpec.describe "Chats Messages", type: :system do
  let(:user) { create(:user) }
  let(:chat) { create(:chat) }

  before { login_as(user, scope: :user) }

  describe "sending chats messages" do
    it "creates and displays the new message", js: true do
      expect do
        visit chat_path(chat)
        find('#new-message-body').set("Hello there!\n")

        expect(page).to have_content("Hello there!")
      end.to change(chat.messages, :count).by(1)
    end
  end

  describe "receives messages from other users", js: true do
    let(:other_user) { create(:user) }

    it "displays the message correctly" do
      visit chat_path(chat)
      create(:message, body: "Hello John!", chat: chat, user: other_user)

      expect(page).to have_content("Hello John!")
      expect(page).to have_content(other_user.full_name)
    end
  end
end
