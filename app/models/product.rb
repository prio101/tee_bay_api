class Product < ApplicationRecord
  has_many :product_rents
  has_many :rents, through: :product_rents
  has_many :product_categories
  has_many :categories, through: :product_categories

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  has_many_attached :images

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
