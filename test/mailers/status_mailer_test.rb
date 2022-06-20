require "test_helper"

class StatusMailerTest < ActionMailer::TestCase
  test "borrow_status" do
    mail = StatusMailer.borrow_status
    assert_equal "Borrow status", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
