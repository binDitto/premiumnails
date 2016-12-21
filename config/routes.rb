Rails.application.routes.draw do

  root 'main#index'

  resources :posts, :services do
    resources 'comments', only: [ :create, :destroy]
  end

  resources 'users', except: 'new'
  resources :categories, except: [:destroy]


  get 'signup', to: 'users#new'

  get 'signin', to: 'sessions#new'
  post 'signin', to: 'sessions#create'
  delete 'signin', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
