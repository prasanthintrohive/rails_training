class RequestController < ApplicationController
    before_action :get_loaned_book, only: [:request_to_return, :approve_to_return,:approve_to_borrow]
    before_action :ensure_admin, only: [:approve_to_return, :approve_to_borrow]
    before_action :get_book, only: [:request_to_borrow]


    def my_book_index
        @loanedbooks = LoanedBook.where(user_id: current_user.id).all
    end

    def borrow
        @search_keyword = params[:query]
        @books, @loaned_books = Book.search(@search_keyword)
    end 


    def request_to_borrow
        @loanedbook = LoanedBook.new
        @loanedbook.user_id = current_user.id
        @loanedbook.loaned_date = Time.now.utc
        @loanedbook.book_id = @book.id
        @loanedbook.due_date =@loanedbook.loaned_date.advance(days: 10)
        @loanedbook.status = LoanedBook::STATUS[:pending]
        if @loanedbook.save
            flash[:notice] =  "your request is pending "
        else 
            flash[:alert] =  @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to root_path
     end


    def request_to_return
        if @loanedbook.update(status: LoanedBook::STATUS[:verify])
          flash[:notice] =  "your return request is under verification"
        else
         flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to request_my_book_index_path
    end

    def approve_to_borrow
        @loanedbook.status = LoanedBook::STATUS[:approved]
        if @loanedbook.save
            flash[:notice] =  "Approved successfully "
        else
           flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to admin_accept_request_index_path
    end

    def approve_to_return        
        @loanedbook.status = LoanedBook::STATUS[:returned]
        @loanedbook.returned_date = Time.now
        if @loanedbook.save
            flash[:notice] =  "verification completed"
        else
            flash[:notice] =   @loanedbook.errors.full_messages&.join(', ')
        end
        redirect_to admin_accept_request_index_path
    end

    

     private

     def ensure_admin
        return if current_user.admin?
        # railse 'Unauthorized access'
     end

     def get_loaned_book
        @loanedbook = LoanedBook.find(params[:id])
     end

     def get_book
        @book = Book.find(params[:id])
     end

     
end
