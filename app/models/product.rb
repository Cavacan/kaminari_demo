class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  paginates_per 10
end
