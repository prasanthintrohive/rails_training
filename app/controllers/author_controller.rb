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
            respond_to do |format|
                format.html {render partial:"author_row", locals:{author: @author} }
            end
        else
            render json: {message: @author.errors.full_messages&.join(', ')}, status: :bad_request
        end

     end
    def update
        if @author.update(params.require(:author).permit(:name))
            flash[:notice] = "author successfully updated!"
            redirect_to author_add_author_path
          else
            flash[:alert] =  @author.errors.full_messages&.join(', ')
            render :edit
        end
    end 
    def destroy
       
        @author.destroy
        flash[:notice] = "The author was successfully destroyed."
        redirect_to author_add_author_path(@author)
    end

    private
    def get_author_id
        @author = Author.find(params[:id])
    end
end
