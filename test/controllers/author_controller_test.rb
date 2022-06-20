require "test_helper"

class AuthorControllerTest < ActionDispatch::IntegrationTest
    test "the truth" do
      get author_add_author_path
      assert_response :success
    end

end
