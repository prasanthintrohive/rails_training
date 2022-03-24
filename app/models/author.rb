class Author < ApplicationRecord
    has_many :books
    has_many :loaned_books
end