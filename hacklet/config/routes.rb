Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'home/index'

  root to: 'home#index'

  devise_for :users

  resources :events
end
