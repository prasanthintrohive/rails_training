class Author < ApplicationRecord
    has_many :loaned_books
end