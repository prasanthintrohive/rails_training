class BookStatusJob < ApplicationJob
  def perform
    change_status
    # calculate_days
  end

  # def change_status
  #   @loanedbooks = LoanedBook.where(status: "over due")
  #   @loanedbooks.each do |loanedbook|
  #     @fine = Fine.new
  #     time = ((Time.now - loanedbook.due_date)/60).ceil
  #       if time > 0
  #         loanedbook.status = LoanedBook::STATUS[:approved]
  #         loanedbook.save
  #       end
  #   end
  # end

  def change_status
    @loanedbooks = LoanedBook.where(status: "approved")
    @loanedbooks.each do |loanedbook|
      @fine = Fine.new
      time = ((Time.now - loanedbook.due_date)/60).ceil
        if time > 0
          loanedbook.status = LoanedBook::STATUS[:over_due]
          loanedbook.save
          @fine.loaned_books_id = loanedbook.id
          @fine.day_count =  0
          @fine.amount = 0
          @fine.status = "unpaid"
          @fine.save!
        end
    end
  end

  def calculate_days
    @fines = Fine.where(status: "unpaid")
    @fines.each do |fine|
      fine.day_count = fine.day_count + 1
      fine.amount = fine.day_count * 10
      fine.save
    end
  end
end
