Rails.application.routes.draw do

  get "/promotions/category", to: "promotions#get_categories"
  get "/promotions/brand", to: "promotions#get_brands"
  get "/promotions/product", to: "promotions#get_products"

  devise_for :users

  scope :api do
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

  end

  root to: "visitors#landingpage"
end
