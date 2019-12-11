Rails.application.routes.draw do
  root 'main#home'

  get 'user/user'
  get 'main/home'

  get 'main/user'

  get 'main/book'


  resources :books



end
