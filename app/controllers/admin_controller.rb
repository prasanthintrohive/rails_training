class AdminController < ApplicationController
    def accept_request_index
        @loanedbooks = LoanedBook.where("status != 'returned'").order("status DESC").page(params[:page]).per(12)
    end
    def access
      @user = User.new
    end
    def user_params
      # @search_keyword = params[:email]
      @user = User.find_by_email(params[:email])
      if @user == nil
        flash[:notice] =   "User does not exist"
      elsif @user.admin == false
        @user.try(:admin) == false
        @user.admin = true
        @user.save
      else
        @user.admin = false
        @user.save
      end
      # redirect_to admin_access_path
    end
end

