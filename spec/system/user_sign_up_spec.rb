# frozen_string_literal: true

require "rails_helper"

RSpec.describe "User sign up", type: :system do
  describe "when filling all information correctly" do
    it "creates the user and redirects to siging page" do
      expect do
        visit new_user_registration_path
        fill_in "First Name", with: "John"
        fill_in "Last Name", with: "Doe"
        fill_in "Email", with: "john@doe.com"
        fill_in "Password", with: "password"
        fill_in "Password Confirmation", with: "password"
        click_button "Register"

        expect(current_url).to eq(new_user_session_url)
      end.to change(User, :count).by(1)
    end
  end

  describe "with a blank field" do
    it "does not creates the user and displays the error messages" do
      expect do
        visit new_user_registration_path
        fill_in "First Name", with: "John"
        fill_in "Email", with: "john@doe.com"
        fill_in "Password", with: "password"
        fill_in "Password Confirmation", with: "password"
        click_button "Register"

        expect(page).to have_content("Last name can't be blank")
      end.not_to change(User, :count)
    end
  end

  describe "when password and confirmation passsword do not match" do
    it "does not creates the user and displays the error messages" do
      expect do
        visit new_user_registration_path
        fill_in "First Name", with: "John"
        fill_in "Last Name", with: "Doe"
        fill_in "Email", with: "john@doe.com"
        fill_in "Password", with: "password1"
        fill_in "Password Confirmation", with: "password2"
        click_button "Register"

        expect(page).to have_content("Password confirmation doesn't match Password")
      end.not_to change(User, :count)
    end
  end
end
