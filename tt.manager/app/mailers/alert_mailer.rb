class AlertMailer < ApplicationMailer
  def send_alert(user)
    mail to: user.email, subject: '練習記録を登録しましょう！'
  end
end


# AlertMailerは、Controllerのイメージ。アクションを設定して、View上で、設定した内容を反映する。メールの文面は、これから作るViewのファイル。
# user.emailは、ベタ書きで自分のアドレス書いてもいい。user.だと変数
# userをtaskにする
