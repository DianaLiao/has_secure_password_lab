Rails.application.routes.draw do
  resources :users, only: [:new, :create]

  get '/welcome', to: 'welcome#index', as: 'welcome'
  get '/login', to: 'sessions#login', as: 'login'
  post '/login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
