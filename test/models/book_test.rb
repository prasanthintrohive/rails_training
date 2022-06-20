require "test_helper.rb"

class BookTest < ActiveSupport::TestCase
  test "should not save article without title" do
    book = Book.new
    assert_not book.save
  end

end

