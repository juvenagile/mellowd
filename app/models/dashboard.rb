class Dashboard < ApplicationRecord
  belongs_to :user
  has_many :user_dashboards, dependent: :destroy
  has_many :users, through: :user_dashboards
  validates :artist_genre, presence: true
  validates :solo_or_band, presence: true
  validates :artist_count, presence: true
  validates :artist_name, presence: true
  validates :artist_instrument, presence: true
  validates :artist_location, presence: true
  validates :artist_travel, presence: true
  validates :artist_radius, presence: true
  validates :artist_cities, presence: true
  validates :artist_description, presence: true
  validates :artist_price, presence: true
  validates :artist_count, numericality: { only_integer: true }
end
