class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable, password_length: 6..128
  has_many :records

  def self.guest
    find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
          # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end