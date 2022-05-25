# frozen_string_literal: true

Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show, :create, :new, :destroy]
  # Defines the root path route ("/")
  root to: "categories#index"
end
