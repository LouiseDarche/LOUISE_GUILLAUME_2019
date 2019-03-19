require 'test_helper'

class AdminMailerTest < ActionMailer::TestCase
  test "guest_answer" do
    mail = AdminMailer.guest_answer
    assert_equal "Guest answer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
