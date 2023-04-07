Rails.application.routes.draw do
  post 'messages', to: 'messages#create'
  delete 'messages/:id', to: 'messages#destroy'
  get 'conversations/:recipient_id', to: 'messages#index'
  resources :reviews
  # resources :messages
  resources :book_exchanges
  resources :books
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :notifications, only: [:index]

  # Defines the root path route ("/")
  # root "articles#index"
post "/signup", to: "users#create"
post "/login", to: "sessions#create"
get "/authorized", to: "sessions#show"
# post 'messages', to: 'messages#create'
get 'conversations/:recipient_id', to: 'messages#index'
delete 'conversations/:id', to: 'conversations#destroy'
end
