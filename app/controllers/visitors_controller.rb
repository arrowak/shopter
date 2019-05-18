class VisitorsController < ApplicationController

  def landingpage
    @promotions = Promotion.where(:active => true)
    @category_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Category}.reject {|item| item.blank?}
    @brand_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Brand}.reject {|item| item.blank?}
    @product_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Product}.reject {|item| item.blank?}
  end

  def category
    @category = Category.find(params[:category_id])
    breadcrumb @category.name, :visitor_category_path, match: :exclusive
    @products = @category.products
  end

  def category_product
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    breadcrumb @category.name, :visitor_category_path, match: :exclusive
    breadcrumb @product.name, :visitor_category_product_path, match: :exclusive
  end
end
