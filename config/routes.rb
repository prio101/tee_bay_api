Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy]

      resources :categories, only: [:index, :show, :create, :update, :destroy]

      resources :orders, only: [:index, :show, :create, :update, :destroy]

      resources :rents, only: [:index, :show, :create, :update, :destroy]

      resources :roles, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
