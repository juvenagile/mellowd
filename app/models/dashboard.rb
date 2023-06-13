class Dashboard < ApplicationRecord
  has_many :user_dashboards
  has_many :users, through: :user_dashboards
end
