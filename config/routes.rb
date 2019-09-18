# frozen_string_literal: true

Rails.application.routes.draw do
  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    get 'home/index'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    ActiveAdmin.routes(self)
    root to: 'home#index'
    resources :ads
    resources :categories, only: %i[show]
    resources :users, only: %i[show]
  end
end
