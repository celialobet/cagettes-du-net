Rails.application.routes.draw do
  
  root 'baskets#index'
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :carts, path: "mon_panier"
  
  resources :baskets do
    resources :selections
  end

  resources :additional_products do
    resources :selections
  end

  resources :users 
end
