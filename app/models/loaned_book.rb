class LoanedBook < ApplicationRecord
    belongs_to :user
    belongs_to :loaned_book
end