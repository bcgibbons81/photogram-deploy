Rails.application.routes.draw do
  
  #root 'dashboard#show'

  get 'users/new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'

  resources :sessions, only: [:create]
  resources :users, only: [:new, :create]
  
resources :users do
    resources :posts
end


resources :posts
root  'posts#index'

resources :posts do
  resources :comments
end

get 'profiles/show'
get ':user_name', to: 'profiles#show', as: :profile
get ':user_name/edit', to: 'profiles#edit', as: :edit_profile
patch ':user_name/edit', to: 'profiles#update', as: :update_profile

end
