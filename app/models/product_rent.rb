class ProductRent < ApplicationRecord
  belongs_to :product
  belongs_to :rent
end
