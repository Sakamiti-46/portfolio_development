class Record < ApplicationRecord
  validates :learning_point, presence: true
  has_many :outputs
  accepts_nested_attributes_for :outputs
  #belong to :users, through :outputs
  has_many :practices
  accepts_nested_attributes_for :practices
  #belong to :users, through :practices
  has_many :tasks
  accepts_nested_attributes_for :tasks
  #belong to :users, through :tasks
end
