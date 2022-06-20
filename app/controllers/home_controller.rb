class HomeController < ApplicationController
    def index
        redirect_to home_borrow_path
    end

    def dashboard
        @books = Book.where(is_deleted: false)
        @loanedbooks = LoanedBook.all
        @relation = @loanedbooks.where(created_at: 7.days.ago.beginning_of_day..Time.now)


        @totalbooks = @loanedbooks.count
        @returned_book = @loanedbooks.where(status: "returned").count
        @pending_book= @loanedbooks.where(status: "pending").count
        @verify = @loanedbooks.where(status: "under verification").count
        @approved = @loanedbooks.where(status: "approved").count
        @over_due = @loanedbooks.where(status: "over due").count
        @values = [@totalbooks,@returned_book,@pending_book,@verify,@approved,@over_due]
    end

end
