class StatusMailer < ApplicationMailer
  # default from: "libmanage@gmail.com"
  #Ex:- :default =>''

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.status_mailer.borrow_status.subject
  #
  def borrow_status(user,loanedbook)
    @loanedbook = loanedbook
    @book = Book.find_by(id: @loanedbook.book_id)
    @user = user
    mail to: user.email, subject: " About borrow request"
  end

  def return_status(user,loanedbook)
    @loanedbook = loanedbook
    @time = ((Time.now - loanedbook.due_date)/60).ceil
    if @time > 0
      @fine = Fine.find_by(id: @loanedbook.id)
    end
    @book = Book.find_by(id: @loanedbook.book_id)
    @user = user
    mail to: user.email, subject: " About return request "
  end

  def prior_remainder(user,loanedbook)
    @loanedbook = loanedbook
    @book = Book.find_by(id: @loanedbook.book_id)
    @user = user
    mail to: user.email, subject: " About Book return last date "
  end

  def post_remainder(user,loanedbook)
    @loanedbook = loanedbook
    mail to: user.email, subject: " About fine charge"
    @fine = Fine.find_by(id: @loanedbook.id)
  end
end
