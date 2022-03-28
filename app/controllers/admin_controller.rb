class AdminController < ApplicationController
    def add_book_index   
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