class BookController < ApplicationController
    before_action :get_book_id, only: [:edit,:update,:destroy, :delete_book]
    def add_book 
        @authors = Author.all
        @books = Book.where(is_deleted: false)
        @value = params[:show_deleted]
        
    end 
    def checkbox
        @value = params[:show_deleted]
        if @value == 'true'
            books = Book.all
        else
            books = Book.where(is_deleted: false)
        end 
        respond_to do |format|
            format.html { render partial: 'books_table', locals: {books: books}}
            format.js
        end
    end
    def edit
        @authors = Author.all
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
        @authors = Author.all
        if @book.update(params.require(:book).permit(:title, :published_year, :author_id))
            flash[:notice] = "book  successfully updated!"
            redirect_to book_add_book_path
          else
            flash[:alert] = @book.errors.full_messages&.join(', ')
            render :edit
        end
    end
    def delete_book
        @book.is_deleted = true
        if @book.save
            flash[:notice] = "The book was successfully destroyed."
        else
            @book.error.full_messages&.join(', ')
        end

        redirect_to book_add_book_path(@book)
    end 
    
    private
    def get_book_id
        @book = Book.find(params[:id])
    end
end
