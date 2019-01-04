Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'

  resources :countries, only: :index do
    resources :user_countries, only: :create
    resources :allergies, only: [:index, :show] do
      resources :translations, only: [:show, :create, :update]
      resources :user_translations, only: :create
    end
  end

  resources :users, only: :show do
    resources :contacts, only: :index
  end
  resources :translations, only: :show
  resources :allergies, only: [:index, :show] do
    resources :user_allergies, only: [:create]
  end
  resources :user_allergies, only: [:create, :destroy]
end

