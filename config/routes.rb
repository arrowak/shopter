Rails.application.routes.draw do

  devise_for :users

  scope :api do
    get "/promotions/category", to: "promotions#get_categories"
    get "/promotions/brand", to: "promotions#get_brands"
    get "/promotions/product", to: "promotions#get_products"

    resources :categories do
      resources :brands
    end
  end

  scope :admin do
    resources :promotions
    resources :categories
    resources :products
    resources :brands
    resources :users
    root to: 'admin#index'
  end

  scope :store do
    root to: "visitors#landingpage"

    get "/category/:category_id", to: "visitors#category", as: "visitor_category"
    get "/category/:category_id/product/:product_id", to: "visitors#category_product", as: "visitor_category_product"
  end

  root :to => redirect('/store')
end
