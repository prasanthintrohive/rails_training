Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"


  # root
  root 'request#borrow'

  #author
  get '/author/:id/edit', to: 'author#edit', as: 'edit_author'
  patch 'author/:id/edit', to: 'author#update'
  get '/author/destroy_me/:id' => 'author#destroy'
  #book
  get '/book/:id/edit', to: 'book#edit', as: 'edit_book'
  patch 'book/:id/edit', to: 'book#update'
  get '/book/:id/delete_book', to: 'book#delete_book', as: 'delete_book'
  get 'home/dashboard'

  get 'admin/access' => 'admin#access'
  post 'user_params' => 'admin#user_params'
  get 'admin/accept_request_index'
  get '/admin/borrow/:id' => 'request#approve_to_borrow'
  get '/admin/return/:id' => 'request#approve_to_return'
  get 'request/my_book_index'
  #request path for borrow and return
  get '/request/borrow/:id' => 'request#request_to_borrow', as: 'borrow_user'
  get '/request/return/:id' => 'request#request_to_return'
  #add book and author
  get 'author/add_author'
  get '/add_book' => 'book#add_book'
  #create author
  post 'author/create_author'=> 'author#create_author', as: 'create_author'
  #create book
  post '/create_book' => 'book#create_book'
  get '/show_deleted' => 'book#show_deleted'
  get 'author/ajax_edit/:id' ,to: 'author#ajax_edit', as: 'ajax_edit'
  patch 'author/ajax_edit/:id', to: 'author#update', as: 'update_author'
end
