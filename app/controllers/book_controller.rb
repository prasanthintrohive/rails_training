class BookController < ApplicationController
    before_action :get_book_id, only: [:edit,:update,:destroy]
    def add_book 
        @book = Book.all 
        @author = Author.all
    end 
    
    def edit
        @author = Author.all
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
        if @book.update(params.require(:book).permit(:title, :published_year, :author_id))
            flash[:success] = "book  successfully updated!"
            redirect_to book_add_book_path
          else
            flash[:alert] = @book.errors.full_messages&.join(', ')
            render :edit
        end
    end
    def destroy
     
        @book.destroy
        flash[:success] = "The book was successfully destroyed."
        redirect_to book_add_book_path(@book)
    end 
    
    private
    def get_book_id
        @book = Book.find(params[:id])
    end
end
