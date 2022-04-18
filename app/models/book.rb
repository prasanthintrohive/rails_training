class Book < ApplicationRecord
    belongs_to :author
    has_many :loaned_books, dependent: :destroy
    validates :title, presence: true, uniqueness: { case_sensitive: true }
    validates :published_year, presence:true

    def self.search(keyword)
        if keyword.blank?
            books = Book.where(is_deleted: false) 
            loanedbooks = LoanedBook.all
        else
            books = Book.joins(:author)
                        .where("books.title ilike :keyword or authors.name ilike :keyword", keyword: "%#{keyword}%")
                        .where(is_deleted: false)
            loanedbooks = LoanedBook.where(book_id: books.select(:id))
        end
        [books, loanedbooks]
    end
end