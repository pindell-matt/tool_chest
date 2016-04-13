require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest
  test "registered user can login" do
    user = User.create(name:     "Anon",
                       email:    "example@aol.com",
                       username: "user",
                       password: "password")

    visit login_path
    fill_in "Username", with: "user"
    fill_in "Password", with: "password"
    click_button "Login"

    assert page.has_content?("Welcome, Anon")
  end
end
