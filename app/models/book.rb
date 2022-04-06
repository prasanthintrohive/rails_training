class Book < ApplicationRecord
    belongs_to :author
    has_many :loaned_books
    validates :title, presence: true, uniqueness: { case_sensitive: true }
    validates :published_year, presence:true

    def self.search(keyword)
        if keyword.blank?
            books = Book.all 
            loanedbooks = LoanedBook.all
        else
            books = Book.where("title ILIKE :query", query: "%#{keyword}%") .or(Book.where(author_id: (Author.where("name ILIKE :query", query: "%#{keyword}%")).ids))
            loanedbooks = LoanedBook.where(book_id: books.select(:id))
        end
        [books, loanedbooks]
    end
end