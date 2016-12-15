Rails.application.routes.draw do

  root 'main#index'
  resources 'posts'
  resources 'users', except: 'new'


  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signin', to: 'sessions#destroy'

  resources 'comments'

  get 'posts', to: 'comments#new'
  post 'posts', to: 'comments#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
