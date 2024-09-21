Rails.application.routes.draw do
     
  get '/users/:id/confirm' => 'users#confirm', as: 'confirm'
  
 patch '/users/:id/confirms' => 'users#confirms', as: 'confirms'
devise_for :users
root to: 'homes#top'
   resources :users, only: [:show, :edit, :create, :index, :update, :destroy] 
   resources :posts, only: [ :edit, :create, :index, :destroy] 
   resources :comments, only: [:show,  :index]
   resources :groups, only: [:create, :index, :destroy] 
   resources :chats, only: [ :create, :index, :destroy] 
end
