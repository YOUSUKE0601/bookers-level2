Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  get '/home/about' => 'homes#about', as: "about"
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end  
  
  post 'follow/:id' => 'relationships#follow', as: "follow"
  post 'unfollow/:id' => 'relationships#unfollow', as: "unfollow"
  

  resources :users, only: [:show, :edit, :update, :index]
end
