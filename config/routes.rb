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

end
