Rails.application.routes.draw do
  resources :teams
  get 'home/index'

  root to: 'home#index'

  devise_for :users

  resources :events
end
