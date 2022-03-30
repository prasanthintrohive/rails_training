class AdminController < ApplicationController

    def add_book_index   
    end 

    def accept_request_index 
        @loanedbook = LoanedBook.all
    end

    def approve_request
        @loanedbook = LoanedBook.find(params[:id])
       if @loanedbook.update(status: "approved")
         flash[:notice] =  "Approved successfully "
       else
        flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
       end
       redirect_to admin_accept_request_index_path
    end

    def book_return_approve
        @loanedbook = LoanedBook.find(params[:id])
        @loanedbook.status = nil
        @loanedbook.returned_date = Time.now
        if @loanedbook.save()
            flash[:notice] =  "verification completed"
        else
            flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
           end
           redirect_to admin_accept_request_index_path
    end
end
