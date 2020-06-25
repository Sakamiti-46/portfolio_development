namespace :send_alert_mail do
  desc "実行処理の説明"
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
