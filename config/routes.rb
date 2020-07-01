Rails.application.routes.draw do
  #get 'books/index'
  #get 'books/show'
  #get 'books/new'
  #get 'books/edit'
  resources :books
  root to: 'books#top'
  #get "/" => "books#top"

end
