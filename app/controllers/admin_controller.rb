class AdminController < ApplicationController
  breadcrumb 'Home', :root_path, match: :exclusive
  layout 'application'
  before_action :authenticate_user!

  def index
    categories = Category.count
    brands = Brand.count
    products = Product.count
    @counts = {}
    @counts['categories'] = categories
    @counts['brands'] = brands
    @counts['products'] = products
  end

end