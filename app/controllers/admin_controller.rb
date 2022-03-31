class AdminController < ApplicationController

    before_action :get_loaned_book, only: [:approve_request, :book_return_approve]



    def accept_request_index 
        @loanedbook = LoanedBook.all
    end

    def approve_request
       if @loanedbook.update(status: LoanedBook::STATUS[:approved])
         flash[:notice] =  "Approved successfully "
       else
        flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
       end
       redirect_to admin_accept_request_index_path
    end

    def book_return_approve        
        @loanedbook.status = LoanedBook::STATUS[:returned]
        @loanedbook.returned_date = Time.now
        if @loanedbook.save()
            flash[:notice] =  "verification completed"
        else
            flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
           end
           redirect_to admin_accept_request_index_path
    end

    private
    
     def get_loaned_book
        @loanedbook = LoanedBook.find(params[:id])
     end

end
