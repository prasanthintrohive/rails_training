class HomeController < ApplicationController
    def index
    end
    def borrow
        @book = Book.all
    end 
end