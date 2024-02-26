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
  get 'customer/home', to: 'customer#home', as: 'customer_home'
  get 'owner/home', to: 'owner#home', as: 'owner_home'
  get 'admin/home', to: 'admin#home', as: 'admin_home'
  get "up" => "rails/health#show", as: :rails_health_check
end
