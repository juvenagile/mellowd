class Booking < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validate :date, presence: true
  validate :status, presence: true
end
