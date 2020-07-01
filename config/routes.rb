Rails.application.routes.draw do
  #get 'books/index'
  #get 'books/show'
  #get 'books/new'
  #get 'books/edit'
  resources :books
  get "/" => "books#top"


end
