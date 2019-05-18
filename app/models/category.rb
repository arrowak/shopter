class Category < ApplicationRecord
  has_many :brands

  def products
    Product.joins("INNER JOIN brands ON products.brand_id = brands.id").joins("INNER JOIN categories ON brands.category_id = categories.id").where("categories.id = #{self.id}")
  end
end
