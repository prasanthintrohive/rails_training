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
            flash[:notice] =  "Author already present please enter correctly"
        end
     end
end