require "test_helper.rb"

class AuthorTest < ActiveSupport::TestCase
  test "should not save article without title" do
    author = Author.new
    assert_not author.save
  end

end

