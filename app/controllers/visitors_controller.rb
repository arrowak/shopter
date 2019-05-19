class VisitorsController < ApplicationController
  before_action :authenticate_user!, :only => [:cart]

  def landingpage
    @promotions = Promotion.where(:active => true)
    @category_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Category}.reject {|item| item.blank?}
    @brand_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Brand}.reject {|item| item.blank?}
    @product_promotions = @promotions.map {|promotion| promotion if promotion.promotable.is_a? Product}.reject {|item| item.blank?}
  end

  def category
    @category = Category.find(params[:category_id])
    breadcrumb @category.name, :visitor_category_path, match: :exclusive
    @products = @category.products.order("quantity DESC")
  end

  def category_product
    @category = Category.find(params[:category_id])
    @product = Product.find(params[:product_id])
    breadcrumb @category.name, :visitor_category_path, match: :exclusive
    breadcrumb @product.name, :visitor_category_product_path, match: :exclusive
  end

  def cart
    @cart_items = current_user.carts
    @user_addresses = current_user.user_addresses
    breadcrumb "Shopping Cart", :visitor_cart_path, match: :exclusive
  end

  def buy
    cart = Cart.new({:user_id => current_user.id, :product_id => params[:product_id]})
    cart.save
    delivery_address_id = current_user.user_addresses.first.id
    redirect_to "/store/review/#{delivery_address_id}"
  end

  def checkout
    cart_items = current_user.carts

    if cart_items.present?
      order = Order.new
      order.user_purchases ||= []
      cart_items.each do |item|
        purchase = UserPurchase.new
        purchase.user = current_user
        product = Product.find(item.product_id)
        purchase.product = product
        purchase.price = product.price

        if item.quantity > product.quantity
          item.quantity = product.quantity
        end

        purchase.quantity = item.quantity
        purchase.payment_mode = params[:payment_mode]

        purchase.save

        product.quantity -= item.quantity
        product.save

        order.user_purchases.push(purchase.id)
      end
      if order.save
        Cart.where(:user_id => current_user).destroy_all
      end
    end
    redirect_to('/store')
  end

  def review
    @cart_items = current_user.carts
    @delivery_address = UserAddress.find(params[:delivery_address_id])
    breadcrumb "Shopping Cart", :visitor_cart_path, match: :exclusive
    breadcrumb "Review Order", :visitor_review_path, match: :exclusive
  end

  def orders
    @purchases = UserPurchase.where(:user_id => current_user.id).order(created_at: :desc)
  end
end
