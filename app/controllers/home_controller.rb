class HomeController < ApplicationController
    def index
    end
    def dashboard
        @books = Book.all
    end
end