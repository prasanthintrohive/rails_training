class BookController < ApplicationController
    def add_book 
        @book = Book.all 
        @author = Author.all
    end 
    def edit
        @book = Book.find(params[:id])
        @author = Author.all
    end
    def create_book
        @book = Book.new(params.require(:book).permit(:title, :published_year, :author_id)) 
        if @book.save
            redirect_to book_add_book_path
            flash[:notice] =  "the book was created successfully "
        else 
            redirect_to book_add_book_path
            flash[:alert] =  @book.errors.full_messages&.join(', ')
        end
     end 
     def update 
        @book = Book.find(params[:id])
        if @book.update(params.require(:book).permit(:title, :published_year, :author_id))
            flash[:notice] = "book  successfully updated!"
            redirect_to book_add_book_path
          else
            flash.now[:alert] = @book.errors.full_messages&.join(', ')
            render :edit
        end
     end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:notice] = "The book was successfully destroyed."
        redirect_to book_add_book_path(@book)
    end 
end
