class Task < ApplicationRecord
  validates :task_name, presence: true
  belongs_to :record
end