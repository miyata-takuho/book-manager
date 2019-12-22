Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  # resources :users

  devise_scope :user do
    root 'users/registrations#new'
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
    get "/users/sign_out", :to => "users/sessions#destroy"
  end


  # root 'books#new'


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
