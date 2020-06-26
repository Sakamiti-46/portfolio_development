class Output < ApplicationRecord
  validates :output_name, presence: true
  belongs_to :record
end