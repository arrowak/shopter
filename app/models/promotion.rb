class Promotion < ApplicationRecord
  belongs_to :promotable, polymorphic: true
  has_many :products, as: :promotable
  has_many :categories, as: :promotable
  has_many :brands, as: :promotable
  has_one_attached :image

  def self.promotable_models
    %w(Category Brand Product)
  end
end
