class Discover < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  validates :content, :title, presence: true
end
