# Preview all emails at http://localhost:3000/rails/mailers/alert_mailer
class AlertMailerPreview < ActionMailer::Preview
  def send_alert
    @user = User.all
    AlertMailer.send_alert(@user)
    # user = User.all.sample
    # AlertMailer.send_alert
    # AlertMailer.with(user: User.first).send_alert
    # @user = User.find_by(id: user)
    # mail(
    #   to: @user.email,
    #   subject: '練習記録を登録しましょう！'
    # )
    # mail to: "#{@user.email}", subject: "Hello,#{@user.email}"
    # mail to: user.email, subject: '練習記録を登録しましょう！'
  end
end
