Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'tweets#index'

  #root 'hello#index'
  get 'hello/link' => 'hello#link'


  get 'tweets' => 'tweets#index'

  get 'tweets/new' => 'tweets#new'

  post 'tweets' => 'tweets#create'

  get 'tweets/:id' => 'tweets#detail',as: 'tweet'

  patch 'tweets/:id' => 'tweets#update'
  delete 'tweets/:id' => 'tweets#destroy' 
  get 'tweets/:id/edit' => 'tweets#edit', as:'edit_tweet'

  get 'tweets/:id/mypage' => 'users#show', as:'mypage'

  

  resources :users, only: [:show]
  resources :users, only: [:show, :edit, :update]

  resources :tweets do
    resources :likes, only: [:create, :destroy]

  resources :comments, only: [:create]
  end




  

  

  
  

  



  
  
end
