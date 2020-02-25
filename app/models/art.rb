class Art < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals
  has_many_attached :photos
end
