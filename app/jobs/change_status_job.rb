class ChangeStatusJob
    def before(job)
        pp "Before processing, number of outdated books: #{LoanedBook.where(status: 'Outdated').count}"
    end
    def perform
        pp "******* performing the Job *******"
        change_status
    end
    def after(job)
        pp "After processing, number of outdated books: #{LoanedBook.where(status: 'Outdated').count}"
    end
    def success
        pp "******* Yes your job processed successfully!!! ******* "
    end
    def change_status
        @loaned_books = LoanedBook.all
        @loaned_books.each do |loanedbook|
            if loanedbook.due_date < DateTime.now
                loanedbook.status = LoanedBook::STATUS[:outdated]
                loanedbook.save
            end
        end 
        pp "status changed to out dated"
    end
end