class HomeController < ApplicationController
    def index
        redirect_to home_borrow_path
    end

    def dashboard
    
        @user_id = params[:user_id]
       
        if @user_id 
        
            @user_info = User.find(@user_id)
            respond_to do |format|
                format.html { render partial: 'user_detail' ,locals:{user_info:@user_info}}
            end
              
        end
       


        @users = User.all
        @user = User.find(current_user.id)
        @check_admin = @user.admin
        if @check_admin
            @loanedbooks = LoanedBook.all
            @relation = @loanedbooks.where(created_at: 7.days.ago.beginning_of_day..Time.now)  
           
        else
            @loanedbooks = LoanedBook.where(user_id: current_user.id).all
            @relation = @loanedbooks.where(created_at: 7.days.ago.beginning_of_day..Time.now)  
        end
        @totalbooks = @loanedbooks.count
        @pending_book = @loanedbooks.where(status:"approved").count
        @returned_book = @loanedbooks.where(status:"returned").count
        @values = [@totalbooks,@pending_book,@returned_book]


    end
end

