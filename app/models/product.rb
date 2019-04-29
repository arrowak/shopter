class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many_attached :images
  has_many :promotions, as: :promotable
end
