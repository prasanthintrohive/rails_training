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

    def create_author
        @author = Author.new(params.require(:author).permit(:name)) 
        if @author.save
            redirect_to admin_add_book_index_path
            flash[:notice] =  "the author was created successfully "
        else 
            redirect_to admin_add_book_index_path
            flash[:alert] =  @author.errors.full_messages&.join(', ')
        end
     end
     def create_book
        @book = Book.new(params.require(:book).permit(:title, :published_year, :author_id)) 
        if @book.save
            redirect_to admin_add_book_index_path
            flash[:notice] =  "the book was created successfully "
        else 
            redirect_to admin_add_book_index_path
            flash[:alert] =  "book already present please enter correctly"
        end
     end 
end