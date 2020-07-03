namespace :send_alert_mail do
  desc "練習記録のリマインドメールの送信"
  task main: :environment do
    # puts "Hello World"

    User.all.each do |user|
      AlertMailer.send_alert(user).deliver_later
    end
  end
  puts "done."
end

# namespace :send_alert_mail do
# end
