require "test_helper"

class AuthorControllerTest < ActionDispatch::IntegrationTest

  include Devise::Test::IntegrationHelpers
  test "add author" do
      @user = users(:one)
      sign_in @user
      get author_add_author_path
      assert_response :success
  end

end
