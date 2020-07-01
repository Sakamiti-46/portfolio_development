class AlertMailer < ApplicationMailer
  def send_alert(user)
    @user = user
    user.inspect
    mail to: 'saito.k.13184@gmail.com', subject: '練習記録を登録しましょう！'
    # mail to: "#{@user.email}", subject: "Hello,#{@user.email}"
    # mail to: user.email, subject: '練習記録を登録しましょう！'
  end
end
