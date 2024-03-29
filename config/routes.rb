Rails.application.routes.draw do
  devise_for :users
  get 'events/index'

  root "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events

  resources :users, only: [:show]

  resources :admissions, only: [:new, :destroy]

  resources :invites, only: [:new, :create]

end
