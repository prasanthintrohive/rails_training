class LoanedBook < ApplicationRecord
    belongs_to :user
    belongs_to :book
    has_many :fines
    STATUS = {pending: 'pending', returned: 'returned',verify: 'under verification',approved: 'approved',over_due: "over due"}.freeze
end
