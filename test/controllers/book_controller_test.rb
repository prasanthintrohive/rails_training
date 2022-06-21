require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  test "admin permitted to add book" do
      @user = users(:one)
      sign_in @user
      get add_book_path
      assert_response :success
  end

  test "get my book" do
    @user = users(:one)
    sign_in @user
    get request_my_book_index_path
    assert_response :success
  end
end
