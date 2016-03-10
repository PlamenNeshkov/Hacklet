Rails.application.routes.draw do
  # General
  root to: 'home#index'
  get 'home/index'

  # Custom
  resources :teams
  resources :events

  # Third party
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
end
