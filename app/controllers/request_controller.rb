class RequestController < ApplicationController
    def my_book_index
        @loanedbooks = LoanedBook.where(user_id: current_user.id).all
    end

    def borrow
        @loanedbook = LoanedBook.all
        @book = Book.all 
    end 

    def request_to_return
        @loanedbook = LoanedBook.find(params[:id])
        if @loanedbook.update(status: LoanedBook::STATUS[:verify])
          flash[:notice] =  "your return request is under verification"
        else
         flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to request_my_book_index_path
    end

    def request_to_borrow
        @loanedbook = LoanedBook.new
        @loanedbook.user_id = current_user.id
        @loanedbook.loaned_date = Time.now.utc
        @book = Book.find(params[:id])
        @loanedbook.book_id = @book.id
        @loanedbook.due_date =@loanedbook.loaned_date.advance(days: 10)
        @loanedbook.status = LoanedBook::STATUS[:pending]
        if @loanedbook.save
            flash[:notice] =  "your request is pending "
        else 
            flash[:alert] =  @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to request_borrow_path
     end
end