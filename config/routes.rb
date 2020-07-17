Rails.application.routes.draw do
  devise_for :users, :controllers => {
   :registrations => 'users/registrations',
   :sessions => 'users/sessions'
 }

 devise_scope :user do
   get "sign_in", :to => "users/sessions#new"
   delete "sign_out", :to => "users/sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 end
  get 'message/:id' => 'messages#show', as:'message'
  get 'users/index'
  get 'tags/:tag', to: 'games#index', as: :tag
  get "/" => "homes#index"
  get "/about" => "homes#show"
  post '/homes/guest_sign_in', to: 'homes#new_guest'
  resources :messages, only: [:create]
  resources :users
  resources :games do
    resources :game_comments, only:[:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end





end
