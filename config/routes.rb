Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'create_user', to: 'user#create'
  get 'index_user',to: 'user#index'
  put '/update_user/:id', to: 'user#update'
  delete 'destroy_user/:id' , to: 'user#destroy'

  post 'create_education/:id', to: 'education#create'
  get 'index_education' , to: 'education#index'
  put '/update_education/:id', to: 'education#update'
  delete 'destroy_education/:id' , to: 'education#destroy'




end
