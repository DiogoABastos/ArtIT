class Art < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
end
