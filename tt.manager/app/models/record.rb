class Record < ApplicationRecord
  validates :learning_point, presence: true
  has_many :outputs
  #belong to :users, through :outputs
  has_many :practices
  #belong to :users, through :practices
  has_many :tasks
  #belong to :users, through :tasks
end
