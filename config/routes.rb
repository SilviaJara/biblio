Rails.application.routes.draw do
  get '/book_lends/new/:book_id', to: 'book_lends#new', as: 'new_book_lend'


  patch  '/devolver/:id', to: 'book_lends#return_book', as: 'return_book'

  devise_for :users
  get 'home/index'


  resources :book_lends
  resources :books
  resources :autors
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
