class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :records
  # has_many :outputs, through: :records
  # has_many :practices, through: :records
  # has_many :tasks, through: :records
  # accepts_nested_attributes_for :records
  def self.guest
    find_or_create_by(email: "guest@example.com") do |user|
      user.password = SecureRandom.urlsafe_base64
          # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end
end