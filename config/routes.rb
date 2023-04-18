Rails.application.routes.draw do
  resources :posts
  devise_for :users
  root 'static_pages#landing_page'
  get 'dashboard', to: 'static_pages#dashboard'

  resources :api_tokens, only: [:index, :create, :update]
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :posts, only: [:index, :show, :create, :update, :destroy]
        get "home/index", to: "home#index"
      end
    end
  end
end
