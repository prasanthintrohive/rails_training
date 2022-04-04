class AuthorController < ApplicationController
  before_action :get_author_id, only: [:update,:destroy,:edit]
    def add_author
        @author = Author.all
    end
    def edit
    end
    def create_author
        @author = Author.new(params.require(:author).permit(:name)) 
        if @author.save
            redirect_to author_add_author_path
            flash[:notice] =  "the author was created successfully "
        else 
            redirect_to author_add_author_path
            flash[:alert] =  @author.errors.full_messages&.join(', ')
        end
     end
    def update
        if @author.update(params.require(:author).permit(:name))
            flash[:success] = "author successfully updated!"
            redirect_to author_add_author_path
          else
            flash.now[:error] = "author item update failed"
            render :edit
        end
    end 
    def destroy
       
        @author.destroy
        flash[:success] = "The author was successfully destroyed."
        redirect_to author_add_author_path(@author)
    end

    private
    def get_author_id
        @author = Author.find(params[:id])
    end
end
