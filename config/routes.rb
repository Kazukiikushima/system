Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  
  resources :items, only: [:new] do
    member do
      post 'reject'
      post 'order'
    end
  end
  
  resources :stage_logs, only: [:create, :index]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
