Rails.application.routes.draw do
  # General
  root to: 'home#index'
  get 'home/index'

  # Custom
  resources :teams
  resources :events
  resources :invites

  # Third party
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  # RETARDED INDIAN CSS MAZACH
  devise_scope :user do
    post "/users/sign_up" => "users/registrations#create"
  end
end
