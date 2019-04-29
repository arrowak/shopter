class VisitorsController < ApplicationController

  def landingpage
    @promotions = Promotion.where(:active => true)
    @category_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Category}.reject {|item| item.blank?}
    @brand_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Brand}.reject {|item| item.blank?}
    @product_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Product}.reject {|item| item.blank?}
  end

  def category
    @category = Category.find(params[:category_id])

  end
end
