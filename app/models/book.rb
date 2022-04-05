class Book < ApplicationRecord
    belongs_to :author
    has_many :loaned_books
    validates :title, presence: true, uniqueness: { case_sensitive: true }
    validates :published_year, presence:true
end