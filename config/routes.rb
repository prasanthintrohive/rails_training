Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get 'request/borrow'
  get 'home/my_book'
  #author
  get '/author/:id/edit', to: 'author#edit', as: 'edit_author'
  patch 'author/:id/edit', to: 'author#update'
  delete 'author/:id', to: 'author#destroy'
  #book
  get '/book/:id/edit', to: 'book#edit', as: 'edit_book'
  patch 'book/:id/edit', to: 'book#update'
  delete '/book/:id', to: 'book#destroy'
  get 'home/history'
  # get 'home/borrow
  get 'admin/accept_request_index'
  get '/admin/borrow/:id' => 'request#approve_to_borrow'
  get '/admin/return/:id' => 'request#approve_to_return'
  get 'request/my_book_index'
  get '/request/borrow/:id' => 'request#request_to_borrow', as: 'borrow_user'
  get '/request/return/:id' => 'request#request_to_return'
  get 'author/add_author'
  get 'book/add_book'
  post 'author/create_author'
  post 'book/create_book'
end
