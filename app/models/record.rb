class Record < ApplicationRecord
  validates :learning_point, presence: true
  validates :training_date, presence: true

  belongs_to :user
  has_many :outputs, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :tasks, dependent: :destroy

  accepts_nested_attributes_for :outputs
  accepts_nested_attributes_for :practices
  accepts_nested_attributes_for :tasks
end
