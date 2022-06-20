class Fine < ApplicationRecord
  belongs_to :loaned_book, optional: true
  STATUS = {paid: "paid", unpaid: "unpaid" }
end
