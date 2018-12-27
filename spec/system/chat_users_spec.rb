require "rails_helper"

RSpec.describe "Chats Users", type: :system do
  let(:user) { create(:user) }
  let(:chat) { create(:chat) }

  before { login_as(user, scope: :user) }

  describe "chat users section" do
    let(:other_user) { create(:user) }

    before { ConnectedList.add(chat.id, other_user.id) }

    it "displays connected users" do
      visit chat_path(chat)
      expect(page).to have_content(other_user.full_name)
    end
  end
end
