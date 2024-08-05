class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  paginates_per 10

  def self.ransackable_attributes(auth_object = nil)
    %w[id name price created_at updated_at]
  end

  def self.ransackable_associations(auth_object = nil)
    ['id', 'name', 'price', 'created_at', 'updated_at']
  end
end
