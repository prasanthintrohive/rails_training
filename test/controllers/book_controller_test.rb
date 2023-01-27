require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  context 'test index page' do

    setup do
      sign_in users(:one)
    end

    should 'have 2 records' do
      # binding.pry
      get root_path
      assert_response :success
      assert_select 'table tbody', 1
    end
  end
end
