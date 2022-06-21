require "test_helper.rb"

class BookTest < ActiveSupport::TestCase
  include Devise::Test::IntegrationHelpers

  test "should not save book without title" do
    books = Book.new
    assert_not books.save
  end
  test "new book with author id" do
    a1 = authors(:a1)
    author = Author.new
    author.id = a1.id
    author.name = a1.name
    author.created_at = a1.created_at
    author.created_at = a1.updated_at
    author.save!
    b1 = books(:b1)
    book = Book.new
    book.title = b1.title
    book.published_year = b1.published_year
    book.author_id = b1.author_id
    book.is_deleted = b1.is_deleted
    assert book.save
  end
end

