class Event < ApplicationRecord
  validates :title, presence: true, length: {in: 1..128 }
  validates :date, presence: true
  validates :location, presence: true, length: {in: 1..128 }
  validates :description, presence: true, length: {in: 1..512 }
end
