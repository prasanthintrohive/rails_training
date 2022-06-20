require "test_helper"

class AuthorTest < ActiveSupport::TestCase
  test "should not save article without title" do
    article = Author.new
    binding.pry
    assert_not article.save
  end

end

