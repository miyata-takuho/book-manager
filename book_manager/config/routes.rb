Rails.application.routes.draw do
  root 'books#new'

  get 'user/user'
  get "books/index" => "books#index"
  get "books/new" => "books#new"
  get "books/:id" => "books#show"
  post "books/create" => "books#create"
  get "books/:id/edit" => "books#edit"
  post "books/:id/update" => "books#update"
  post "books/:id/destroy" => "books#destroy"
# get 'book/new/:id', to: 'books#new', as: :books_new

  resources :books

end
