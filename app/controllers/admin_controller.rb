class AdminController < ApplicationController
    def accept_request_index 
        @loanedbooks = LoanedBook.all
    end
end
