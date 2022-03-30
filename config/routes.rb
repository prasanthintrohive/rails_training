Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
  get 'home/borrow'
  get 'home/my_book'
  
  get 'home/history'
  # get 'home/borrow
  get 'admin/add_book_index'
  get 'admin/accept_request_index'
  post 'admin/create_author'
  post 'admin/create_book'
  get '/home/:id' => 'home#request_to_borrow'
  get '/admin/:id' => 'admin#approve_request'
  get '/admins/:id' => 'admin#book_return_approve'
  get 'user/my_book_index'
  get '/user/:id' => 'user#request_to_return'
end
