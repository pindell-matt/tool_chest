require 'test_helper'

class UserCreationTest < ActionDispatch::IntegrationTest
  test "a user can be created" do
    visit new_user_path

    fill_in "Name", with: "Anon"
    fill_in "Email", with: "example@aol.com"
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Create Account"

    assert page.has_content?("Welcome, Anon")
  end
end
