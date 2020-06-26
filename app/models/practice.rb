class Practice < ApplicationRecord
  validates :practice_item, presence: true
  validates :practice_time, presence: true
  belongs_to :record
end