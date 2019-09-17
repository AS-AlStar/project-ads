# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/index'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  ActiveAdmin.routes(self)
  root to: 'home#index'
  resources :ads
  resources :categories do
    resources :ads
  end
  resources :users, only: %i[show]
end
