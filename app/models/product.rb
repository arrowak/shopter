class Product < ApplicationRecord
  belongs_to :category
  belongs_to :brand
  has_many_attached :images
  has_many :promotions, as: :promotable
  has_many :user_purchases

  def html_price
    "<i class=\"fas fa-rupee-sign inline\"></i> #{self.price.round}/-".html_safe
  end
end
