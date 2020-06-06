class Practice < ApplicationRecord
  validates :practice_item, presence: true
  validates :practice_time, presence: true
  belongs_to :record
  # has_many :users, through: :records
end