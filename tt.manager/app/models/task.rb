class Task < ApplicationRecord
  validates :task_name, presence: true
  belongs_to :record
  # has_many :users, through: :records
end