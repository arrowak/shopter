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

  scope :store do
    root to: "visitors#landingpage"

    resources :carts
    get "/category/:category_id", to: "visitors#category", as: "visitor_category"
    get "/category/:category_id/product/:product_id", to: "visitors#category_product", as: "visitor_category_product"
    get "/cart", to: "visitors#cart", as: "visitor_cart"
    get "/add_to_cart/:user_id/:product_id", to: "carts#create", as: "visitor_add_to_cart"
    get "/remove_from_cart/:user_id/:product_id", to: "carts#destroy", as: "visitor_remove_from_cart"
    get "/buy/:product_id", to: "visitors#buy", as: "visitor_buy"
    get "/checkout/:payment_mode", to: "visitors#checkout", as: "visitor_checkout"
    get "review/:delivery_address_id", to: "visitors#review", as: "visitor_review"
    get "/orders", to: "visitors#orders", as: "visitor_orders"
  end


  scope :admin do
    resources :promotions
    resources :categories
    resources :products
    resources :brands
    resources :users
    get "/orders", to: "admin#orders", as: "admin_orders"
    root to: 'admin#index'
  end


  get "/account_info", to: "visitors#account_info", as: "visitor_account_info"
  resources :user_addresses
  root :to => redirect('/store')
end
