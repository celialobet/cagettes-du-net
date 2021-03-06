Rails.application.routes.draw do

  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }

  root 'baskets#index'
  
  get '/notre_equipe', to: 'static_pages#team'

  resources :carts, path: "mon_panier", only: [:create, :show, :update]
  
  resources :baskets, path: "cagette", only: [:show, :index] do 
    resources :selections, only: [:create, :destroy]
  end

  resources :additional_products, only: [:index] do
    resources :selections, only: [:create, :destroy]
  end

  resources :users, path: "mon_profil", only: [:create, :show, :edit, :update] do
    resources :avatars, only: [:create, :update]
  end

  resources :locations, path: "nos_lieux", only: [:new, :create, :show, :index] do
    resources :subscriptions, only: [:new, :destroy]
  end

  resources :orders, path: "ma_commande", only: [:new]

  resources :customer_portal_sessions, only: [:create]

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end
end
