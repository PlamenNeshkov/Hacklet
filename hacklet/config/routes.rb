Rails.application.routes.draw do
  # General
  root to: "home#index"
  get "home/index"

  get 'attendances/create/:event_id/:user_id',
    to: 'attendances#create', as: 'create_attendance'
  get 'qr/:event_id/:user_id/code', to: 'qr_codes#show', as: 'qr_code'

  # Custom
  resources :teams
  resources :events

  get "invites/:id/new", to: "invites#new", as: "new_invite"
  post "invites/create", to: "invites#create"
  get "invites/search_recipients", to: "invites#search_recipients"

  # Third party
  get "blog/posts/:id", to: "posts#show", as: "post"

  mount Blogit::Engine => "/blog", as: "blog"
  mount Blogit::Admin::Engine => "/blog/admin"
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users, :controllers => {:registrations => "users/registrations"}

  devise_scope :user do
    post "users/sign_up" => "users/registrations#create"
    get "users/:id/profile", to: "users/registrations#profile", as: "profile"
    get "users/:id/projects", to: "users/registrations#projects", as: "user_projects"
    get "users/:id/settings", to: "users/registrations#edit", as: "user_settings"
    get "users/:id/avatar", to: "users/registrations#avatar", as: "user_avatar"
    post "users/:id/change_avatar", to: "users/registrations#change_avatar", as: "change_avatar"
  end
end
