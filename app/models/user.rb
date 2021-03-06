
class User < ApplicationRecord
  has_secure_password
  
  USERNAME_REGEX = /\S/
  EMAIL_REGEX = /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\z/i
  ZIPCODE_REGEX = /\d/
  
  validates :username,  presence: true, uniqueness: true,   format: USERNAME_REGEX, length: {in: 1..12 }
  validates :email,     presence: true, uniqueness: true,   format: EMAIL_REGEX
  validates :zipcode,   presence: true, uniqueness: false,  format: ZIPCODE_REGEX,  length: {in: 5..5}
  validates :password,  confirmation: true #password_confirmation attr
  
  # Only check the password length when creating a new user
  validates_length_of :password, :in => 8..128, :on => :create
  
  #has_many :games
  #has_many :favorite_games
  #has_many :favorites, through: :favorite_games, source: :game
  
  has_many :favorite_games
  has_many :games, through: :favorite_games
  
  has_many :favorite_events
  has_many :events, through: :favorite_events
end
