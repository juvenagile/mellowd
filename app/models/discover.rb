class Discover < ApplicationRecord
  has_one_attached :photo
  belongs_to :artist, class_name: "User", foreign_key: "user_id"
  validates :content, :title, presence: true
end
