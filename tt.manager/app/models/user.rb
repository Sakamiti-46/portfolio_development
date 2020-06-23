class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  has_many :records
  # has_many :outputs, through: :records
  # has_many :practices, through: :records
  # has_many :tasks, through: :records
  # accepts_nested_attributes_for :records
  
end