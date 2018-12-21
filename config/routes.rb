Rails.application.routes.draw do
  devise_for :users
  root to: 'countries#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :countries, only: :index do
    resources :user_countries, only: :create
    resources :allergies, only: [:index, :show] do
      resources :translations, only: [:show, :create, :update] do
      end
      resources :user_translations, only: :create
      resources :user_allergies, only: :create
    end
  end

  resources :users, only: :show do
    resources :contacts, only: :index
  end
  resources :translations, only: :show
  resources :allergies, only: [:index, :show] do # needed??
    resources :user_allergies, only: [:create]
  end
  resources :user_allergies, only: :create
end

