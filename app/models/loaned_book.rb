class LoanedBook < ApplicationRecord
    belongs_to :user
    belongs_to :book

    STATUS = {pending: 'pending', returned: 'returned',verify: 'under verification',approved: 'approved'}.freeze
end