class HomeController < ApplicationController
    def index
        redirect_to home_borrow_path
    end

    def dashboard
        @loanedbooks = LoanedBook.where(user_id: current_user.id).all
        @relation = @loanedbooks.where(created_at: 7.days.ago.beginning_of_day..Time.now)
                                

        @totalbooks = @loanedbooks.count
        @pending_book = @loanedbooks.where(status:"returned").count
        @returned_book = @loanedbooks.where(status:"pending").count
        @values = [@totalbooks,@returned_book,@pending_book]
    end

end