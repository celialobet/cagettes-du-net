Rails.application.routes.draw do
  
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'baskets#index'
  
  
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

  resources :locations do
    resources :subscriptions
  end

  resources :orders, only: [:new, :create, :index]

  resources :customer_portal_sessions, only: [:create]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
