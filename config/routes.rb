Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  resources :users, only: [:edit, :update, :index, :show, :destroy]
  resources :books, only: [:edit, :create, :index, :show, :update, :destroy] do
   resource :favorites, only: [:create, :destroy]
   resources :book_comments, only: [:create, :destroy]
  end
end

