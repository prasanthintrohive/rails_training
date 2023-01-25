CreateBookJob = Struct.new(:title, :published_year, :author_id) do
    def before(job)
        pp "Before processing, book count is: #{Book.count}"
    end
    def perform
        pp "******* performing the Job *******"
        create_book
    end
    def after(job)
        pp "After processing, book count is: #{Book.count}"
    end
    def success
        pp "******* Yes your job processed successfully!!! ******* "
    end
    def create_book
        book = Book.find_or_initialize_by(title: title, published_year: published_year, author_id: author_id)
        book.save!
    end
end