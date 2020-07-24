Rails.application.routes.draw do
  root 'page#home'
  get 'about',to: 'page#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  #resources :articles , only: [:show]
  resources :articles, only: [:show , :index, :new , :create, :edit,:update,:destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
