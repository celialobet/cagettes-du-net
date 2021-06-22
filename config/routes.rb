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

  resources :users do
    resources :avatars, only: [:create, :update]
  end

  resources :locations

  resources :orders, only: [:new, :create, :index]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
