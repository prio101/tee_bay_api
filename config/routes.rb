Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  namespace :api do
    namespace :v1 do
      resources :products, only: [:index, :show, :create, :update, :destroy] do
        post :assign_category, on: :member
      end

      resources :categories, only: [:index, :show, :create, :update, :destroy]

      resources :orders, only: [:index, :show, :create, :update, :destroy]

      resources :rents, only: [:index, :show, :create, :update, :destroy] do
        post :assign_product, on: :member
      end

      resources :roles, only: [:index, :show, :create, :update, :destroy]
    end
  end

end
