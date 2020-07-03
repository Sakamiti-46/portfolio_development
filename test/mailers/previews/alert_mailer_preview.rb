# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview
  def send_alert
    @user = User.all
    AlertMailer.send_alert(@user)

  end
end
