class BookController < ApplicationController
    before_action :get_book_id, only: [:edit,:update,:destroy, :delete_book]
    def add_book 
        @author = Author.all
        if params[:show_deleted] == '1'
            @book = Book.all 
        else
            @book = Book.where(is_deleted: false)
        end
        @value = params[:show_deleted]
    end

    def edit
        @authors = Author.all
    end
 
    def create_book
        @book = Book.new(params.require(:book).permit(:title, :published_year, :author_id)) 
        if @book.save
            respond_to do |format|
                format.html { render partial: 'book_row', locals:{book: @book} }
              end
        else 
            render json:{message: @book.errors.full_messages&.join(', ')}, status: :bad_request
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

        redirect_to add_book_path(@book)
    end 
    
    private
    def get_book_id
        @book = Book.find(params[:id])
    end
end
