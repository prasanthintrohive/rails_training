class Author < ApplicationRecord
    has_many :books
    validates :name, presence: true, uniqueness: { case_sensitive: true }
end