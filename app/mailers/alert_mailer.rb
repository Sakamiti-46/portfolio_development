class AlertMailer < ApplicationMailer
  def send_alert(user)
    mail to: user.email, subject: '練習記録を登録しましょう！'
  end
end
