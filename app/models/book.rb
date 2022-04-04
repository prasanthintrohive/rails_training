class Book < ApplicationRecord
    belongs_to :author
    has_many :loaned_books, dependent: :delete_all
    validates :title, presence: true, uniqueness: { case_sensitive: true }
end