Rails.application.routes.draw do
  resources :reviews
  resources :book_exchanges
  resources :books
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
