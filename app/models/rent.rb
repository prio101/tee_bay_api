class Rent < ApplicationRecord
  belongs_to :user
  has_many :product_rents
  has_many :products, through: :product_rents

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :price, presence: true
  validates :user_id, presence: true
end
