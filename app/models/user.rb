class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :arts
  #has_many :arts, through: :rentals
  has_one_attached :photo

  has_many :reviews
  has_many :rentals

  has_many :messages

  has_many :channel_users
  has_many :channels, through: :channel_users

end
