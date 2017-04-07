require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "order_success" do
    mail = UserMailer.order_success
    assert_equal "Order success", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
