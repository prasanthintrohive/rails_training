# Preview all emails at http://localhost:3000/rails/mailers/status_mailer
class StatusMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/status_mailer/borrow_status
  def borrow_status
    StatusMailer.borrow_status
  end

end
