Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'post#index'

  get 'posts', to: 'post#index'
  get 'posts/create', to: 'post#create_page'
  get 'posts/:id/edit', to: 'post#edit_page'
  get 'posts/:id', to: 'post#show'
  post 'posts/create', to: 'post#create'
  put 'posts/:id/edit', to: 'post#update'
  delete 'posts/:id', to: 'post#delete'
end
