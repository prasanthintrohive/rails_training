class UserController < ApplicationController
    def my_book_index
        @loanedbook = LoanedBook.all
    end

    def request_to_return
        @loanedbook = LoanedBook.find(params[:id])
        if @loanedbook.update(status: "verify")
          flash[:notice] =  "your return request is under verification"
        else
         flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to user_my_book_index_path
    end
end