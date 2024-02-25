Rails.application.routes.draw do
  get 'customer/home'
  get 'owner/home'
  get 'admin/home'
  devise_for :users
  root 'tablelinks#home'
  # get 'customer/home'
  # get 'owner/home'
  # get 'admin/home', to: 'admin#index', as: 'admin_index'
  get "up" => "rails/health#show", as: :rails_health_check
end
