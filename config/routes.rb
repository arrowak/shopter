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

    resources :carts
    get "/category/:category_id", to: "visitors#category", as: "visitor_category"
    get "/category/:category_id/product/:product_id", to: "visitors#category_product", as: "visitor_category_product"
    get "/cart", to: "visitors#cart", as: "visitor_cart"
    get "/add_to_cart/:user_id/:product_id", to: "carts#create", as: "visitor_add_to_cart"
    get "/remove_from_cart/:user_id/:product_id", to: "carts#destroy", as: "visitor_remove_from_cart"
  end

  root :to => redirect('/store')
end
