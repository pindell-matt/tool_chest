require 'test_helper'

class AdminCategoriesTest < ActionDispatch::IntegrationTest

  test 'logged in admin sees tools index' do
    admin = User.create(name:     "admin",
                        email:    "example@aol.com",
                        username: "admin",
                        password: "password",
                        role:      1)

    ApplicationController.any_instance.stubs(:current_user).returns(admin)
    visit admin_categories_path
    assert page.has_content?("All Categories")
  end
end
