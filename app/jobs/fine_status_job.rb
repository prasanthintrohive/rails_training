class FineStatusJob < ApplicationJob
  def perform
    fine_remainder
  end

  def fine_remainder
    @loanedbooks = LoanedBook.where(status: "over due")
    @loanedbooks.each do |loanedbook|
      days = (Time.now.to_date - loanedbook.due_date.to_date).to_i
      if days%5 == 0
        user = User.find_by(id: loanedbook.user_id)
        StatusMailer.post_remainder(user,loanedbook).deliver
      end
    end
  end
end
