# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview
  def send_alert(user)
    @user = user
    mail to: "#{@user.email}", subject: "Hello,#{@user.email}"
    # mail to: user.email, subject: '練習記録を登録しましょう！'
  end
end
