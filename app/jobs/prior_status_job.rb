class PriorStatusJob < ApplicationJob
  def perform
    remind_prior
  end
  def remind_prior
    @loanedbooks = LoanedBook.where(status: "approved")
    @loanedbooks.each do |loanedbook|
      days = (loanedbook.due_date.to_date - ((Time.now.to_date)-1)).to_i
      if days == 9
        user = User.find_by(id: loanedbook.user_id)
        StatusMailer.prior_remainder(user,loanedbook).deliver
      end
    end
  end
end
