class BookController < ApplicationController
    def add_book 
        @book = Book.all 
    end 
    def edit
        @book = Book.find(params[:id])
    end
    def create_book
        @book = Book.new(params.require(:book).permit(:title, :published_year, :author_id)) 
        if @book.save
            redirect_to book_add_book_path
            flash[:notice] =  "the book was created successfully "
        else 
            redirect_to book_add_book_path
            flash[:alert] =  "book already present please enter correctly"
        end
     end 
     def update 
        @book = Book.find(params[:id])
        if @book.update(params.require(:book).permit(:title, :published_year, :author_id))
            flash[:success] = "book  successfully updated!"
            redirect_to book_add_book_path
          else
            flash[:alert] = @book.errors.full_messages&.join(', ')
            render :edit
        end
     end
    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        flash[:success] = "The book was successfully destroyed."
        redirect_to book_add_book_path(@book)
    end 
end
