class Book < ApplicationRecord
    belongs_to :author
    has_many :loaned_books
    validates :title, presence: true, uniqueness: { case_sensitive: true }
end