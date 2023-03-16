Rails.application.routes.draw do
  devise_for :users
  get 'events/index'

  root "events#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :events, only: [:new, :create, :index, :show, :update, :edit]
  resources :users, only: [:show]

  get 'events/attend', to:  'events#attend'
end
