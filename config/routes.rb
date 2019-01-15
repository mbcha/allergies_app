Rails.application.routes.draw do
  devise_for :users
  # root to: 'countries#index'
  root to: 'users#show'

  resources :countries, only: :index do
    # resources :user, only: [:update]
    # resources :user_countries, only: :create
    resources :allergies, only: [:index, :show] do
      resources :translations, only: :create
    end
  end
  resources :users, only: [:show, :edit, :update] do
    resources :contacts, only: [:index, :create, :update, :destroy]
  end
  resources :translations, only: :show
  resources :allergies, only: [:index, :show] do
    resources :user_allergies, only: :create
  end
  resources :user_allergies, only: [:create, :destroy]

  resources :languages, only: [:index, :show] do
    # resources :user, only: [:update]
    # resources :user_languages, only: :create
    resources :translations, only: :index
    resources :allergies, only: [:index, :show] do
      resources :translations, only: :create
    end
  end
end

