class HomeController < ApplicationController
    def index
        redirect_to home_borrow_path
    end

end