Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    root 'users/registrations#new'
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    post "signup", :to => "users/registrations#create"
    post 'login' => 'devise/sessions#create'
    get "logout", :to => "users/sessions#destroy"
    get "/users/sign_out", :to => "users/sessions#destroy"
    get "user/:id", :to => "users/registrations#detail"
  end

  resources :users

  get 'user/user'
  get "books/index" => "books#index"
  get "books/new" => "books#new"
  post "books/create" => "books#create"
  get "books/:id" => "books#show"
  get "books/:id/edit" => "books#edit"
  post "books/:id/update" => "books#update"
  post "books/:id/destroy" => "books#destroy"

  resources :books

end
