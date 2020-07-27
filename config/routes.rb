Rails.application.routes.draw do
  root 'page#home'
  get 'about',to: 'page#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  #resources :articles , only: [:show]
  resources :articles, only: [:show , :index, :new , :create, :edit,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  delete 'logout', to: 'session#destroy'
end
