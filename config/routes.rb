Rails.application.routes.draw do
  resources :reservations
  
  # resources :tables
  resources :restaurants do
    resources :tables
  end
  # get 'customer/home'
  # get 'owner/home'
  # get 'admin/home'
  devise_for :users
  root 'tablelinks#home'
  #Customer Routes
  get 'customer/home', to: 'customer#home', as: 'customer_home'

  #Owner Routes
  get 'owner/home', to: 'owner#home', as: 'owner_home'
  get 'owner/viewreservations', to: 'owner#viewreservations', as: 'owner_viewreservations'
  get 'owner/viewrestaurants', to: 'owner#viewrestaurants', as: 'owner_viewrestaurants'

  #Admin Routes
  get 'admin/home', to: 'admin#home', as: 'admin_home'
  get 'admin/index', to: 'admin#index', as: 'admin_index'

  
  get "up" => "rails/health#show", as: :rails_health_check
end
