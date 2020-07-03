class AlertMailer < ApplicationMailer
  def send_alert(user)
    @user = user
    mail to: @user.mail, subject: '練習記録を登録しましょう！'
    # mail to: "#{@user.email}", subject: "Hello,#{@user.email}"
  end
end
