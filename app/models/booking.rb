class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :date, presence: true
  validates :status, presence: true
end
