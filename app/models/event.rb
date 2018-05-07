class Event < ApplicationRecord
  validates :title, presence: true, length: {in: 1..128 }
  validates :date, presence: true
  validates :location, presence: true, length: {in: 1..128 }
  validates :description, presence: true, length: {in: 1..512 }
  
  has_many :favorite_events
  has_many :users, through: :favorite_events
end
