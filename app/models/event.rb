class Event < ApplicationRecord
  GENRE = %w[rock pop urban dance/dj ballads tropical regional country instrumental choir].freeze
  has_many :bookings
  has_many :users, through: :bookings
  belongs_to :user
  validates :title, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 29 }
  validates :genre, presence: true, inclusion: { in: %w[rock pop urban dance/dj ballads tropical regional country instrumental choir] }
  validates :location, presence: true
end
