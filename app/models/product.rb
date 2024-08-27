class Product < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true

  paginates_per 10

  def self.ransackable_attributes(_auth_object = nil)
    %w[id name price created_at updated_at]
  end

  def self.ransackable_associations(_auth_object = nil)
    %w[id name price created_at updated_at]
  end
end
