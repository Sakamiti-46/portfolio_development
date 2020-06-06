class Record < ApplicationRecord
  validates :learning_point, presence: true
  validates :training_date, presence: true
  belongs_to :user
  has_many :outputs, dependent: :destroy
  has_many :practices, dependent: :destroy
  has_many :tasks, dependent: :destroy
  # recordとpracticeは、親・子関係
  # has_many :practices
  accepts_nested_attributes_for :outputs
  accepts_nested_attributes_for :practices
  #belong to :users, through :practices
  # has_many :tasks
  accepts_nested_attributes_for :tasks
  #belongs to :users, through :tasks
end
