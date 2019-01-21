Rails.application.routes.draw do
  devise_for :users
  root to: 'users#show'

  resources :users, only: [:show, :edit, :update] do
    resources :contacts, only: [:index, :create, :update, :destroy]
  end

  resources :allergies, only: :index
  resources :allergies, only: :show do
    resources :user_allergies, only: :create
  end
  resources :user_allergies, only: [:create, :destroy]

  resources :countries, only: :index

  resources :languages, only: :index do
    resources :translations, only: :index
    resources :allergies, only: :show do
      resources :translations, only: :create
    end
  end

  resources :translations, only: :show
end

