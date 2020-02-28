class Art < ApplicationRecord
  belongs_to :user
  has_many :users, through: :rentals
  has_many :reviews, dependent: :destroy
  has_one_attached :photo

  has_many :rentals

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
