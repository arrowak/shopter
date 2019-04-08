Rails.application.routes.draw do

  devise_for :users

  scope :admin do
    resources :categories
    resources :products
    resources :brands
    resources :users
    root to: 'visitors#index'
  end


end
