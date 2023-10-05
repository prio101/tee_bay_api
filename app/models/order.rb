class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products

  validates :user, presence: true
  validates :status, presence: true
  validates :total, presence: true

  enum status: { ordered: 'ordered', bought: 'bought' }

end
