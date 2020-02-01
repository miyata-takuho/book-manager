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
    post 'login' => 'users/sessions#create'
    get "logout", :to => "users/sessions#destroy"
    get "/users/sign_out", :to => "users/sessions#destroy"
    get "users/:id", :to => "users/registrations#detail"
    resources :users
   end

   post "books/rental", :to => "books#rental"
   post "books/return", :to => "books#return"
   get "books/index", :to => "books#index"
   post "books/:id/destroy", :to => "books#destroy"
   post "books/:id/update", :to => "books#update"
   resources :books
   resources :rental_logs
end
