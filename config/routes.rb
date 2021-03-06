Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'

  get '/home/about' => 'homes#about', as: "about"

  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:show, :edit, :update, :index] do
    post 'follow' => 'relationships#follow', as: "follow"
    post 'unfollow' => 'relationships#unfollow', as: "unfollow"
    get 'followings' => 'relationships#followings', as: "followings"
    get 'followers' => 'relationships#followers', as: "followers"
  end
  
  get 'search' => "searches#search"



end
