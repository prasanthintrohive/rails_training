class HomeController < ApplicationController
    def index
    end
    def borrow
        @loanedbook = LoanedBook.all
        @book = Book.all 
    end 
    def request_to_borrow
        @loanedbook = LoanedBook.new
        @loanedbook.user_id = current_user.id
        @loanedbook.loaned_date = Time.now.utc
        @book = Book.find(params[:id])
        @loanedbook.book_id = @book.id
        @loanedbook.due_date =@loanedbook.loaned_date.advance(days: 10)
        @loanedbook.status = "pending"
        if @loanedbook.save
            flash[:notice] =  "your request is pending "
        else 
            flash[:alert] =  @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to home_borrow_path
     end
end