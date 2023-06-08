class Event < ApplicationRecord
  GENRE = %w[Rock Pop Urban Dance/DJ Ballads Tropical Regional Country Instrumental Choir].freeze
  has_many :bookings
  has_many :users, through: :bookings, source: :user
  belongs_to :user
  validates :title, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :duration, presence: true, numericality: { greater_than: 29 }
  validates :genre, presence: true, inclusion: { in: %w[Rock Pop Urban Dance/DJ Ballads Tropical Regional Country Instrumental Choir] }
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
