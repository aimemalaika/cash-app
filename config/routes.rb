# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :home, only: [:index]
  resources :categories, only: [:index, :show, :create, :new, :destroy]
  resources :expenses, only: [:index, :new, :create, :destroy]
  # Defines the root path route ("/")
  root to: "home#index"
end
